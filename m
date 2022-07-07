Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77EC569712
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 02:57:16 +0200 (CEST)
Received: from localhost ([::1]:33412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9FpT-0007K5-Mn
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 20:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o9Fnu-0006cx-Vv
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:55:39 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:34531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1o9Fnr-00082J-JE
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 20:55:38 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 149EC580582;
 Wed,  6 Jul 2022 20:55:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 06 Jul 2022 20:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1657155335; x=1657158935; bh=R7hxhWtseQ
 N9theF+MOYHaOSAS65qemIKzkscQhKTlk=; b=DD3hsi/4pK1zAfHiWCCJuBqizf
 MTdc/gD1U1h6nuVhggr6CM8cmTeMzfqOBXFQgVluZruMFnVk6JHLcwxyFmt5nxrU
 sjkSbnUbrd0A5awjIt1n++m4dcIwyt9bBH66RVEezeoVC+NUOzUkeTP7y6givTLW
 ZXyHocrnHtwsW1h54v9gd4yfOLs4P3TNgCgyMa6l+HU5NpxTKvlfb3RQAQhx/klq
 hXYiHvebQgF4a7VWwmZj3AYTyIZqHdvayg8gZsXNHVYwwjBgz0MFWqXklospwRd5
 uvJvik4Di47pYbxmIi0nj7zJwT6N9fQTGalpqy47e/HSSXyi9Cyvk0PHw72g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657155335; x=1657158935; bh=R7hxhWtseQN9theF+MOYHaOSAS65
 qemIKzkscQhKTlk=; b=munITmaRJ2eL1jnmJKhCadTF/SQO715X1qEiT7fLpc/w
 bXQwGF9SuiXVXm+DzO7bysadpByCuxKOpLGaorRhaJ4flnui6CnX+cohsNF/8F2Z
 zxBQS3M079zCC5E1t6M677GFmgdPCw1Gt+dVx4W3h/Fp+Im6PdYap4PFRkpTKfGO
 inDpz/zWhSypf7SYTU23FMaDIHL0kx71OFxmnGY2YRME84dqJ6wPbdPpj8lZaRr1
 YoICXPq6QswjZwJMbZMIv5Zg2aNGCjRoCzp8PCxnHXKAPW6wp9ZW+VsUKWkHNZUj
 4nHwSVszlT/GuQw4fYDmqaLcGK+hX/dP0zBW8GObVw==
X-ME-Sender: <xms:Bi_GYt8vztLatWph3SRNDV6BM6cjhutQ2DrfX2R3ZIkV8ce33X0h6w>
 <xme:Bi_GYhvYVszmWfZCjlxRNbF4hTrRXYJsgJzdXdpBM6frKh8LHENG-I-ZBTmDkFqdF
 QIjh1qIBtlv-I6lGTs>
X-ME-Received: <xmr:Bi_GYrCdZqHmp8a8TFvX9VvH79SNCFAY2xPEde4squYUoodsKPxag3Dxhe7BdCBi196ye6nFHMGxtzKvI8DuNsJD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
 ucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeetjefhheejieejveeikeduvdejleevfeejfedttdekgfeluedugeduteegkeej
 ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvg
 htvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:Bi_GYhewgC1yaNWEwaTBJcSPZeAwbylabAdLVpXsLGffZM5EAHL2hQ>
 <xmx:Bi_GYiNod4HvSz8V8iZDs7ClcVwTPyjPA95RypZnBlax7NsQZaRlCw>
 <xmx:Bi_GYjllkULR4ElkEVaUQ9qP1W1MAvwnwmxphdrPPMGrU3YomCrvCg>
 <xmx:By_GYvrYgdBvZqcotFSkp-c0nCIuyYBlEvQ3F54GKlgIvU819d_dDg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 20:55:34 -0400 (EDT)
Date: Wed, 6 Jul 2022 17:55:32 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] avocado: Fix BUILD_DIR if it's equal to SOURCE_DIR
Message-ID: <YsYvBONMr8hs74TX@pdel-mbp.dhcp.thefacebook.com>
References: <20220702185604.46643-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702185604.46643-1-peter@pjd.dev>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 02, 2022 at 11:56:04AM -0700, Peter Delevoryas wrote:
> I like to build QEMU from the root source directory, rather than cd'ing
> into the build directory. This code may as well include a search path
> for that, so that you can run avocado tests individually without
> specifying "-p qemu_bin=build/qemu-system-arm" manually.

Pinging this thread since I didn't get a response.

> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>  tests/avocado/avocado_qemu/__init__.py | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index b656a70c55..ed4853c805 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -120,14 +120,15 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
>      # qemu binary path does not match arch for powerpc, handle it
>      if 'ppc64le' in arch:
>          arch = 'ppc64'
> -    qemu_bin_relative_path = os.path.join(".", bin_prefix + arch)
> -    if is_readable_executable_file(qemu_bin_relative_path):
> -        return qemu_bin_relative_path
> -
> -    qemu_bin_from_bld_dir_path = os.path.join(BUILD_DIR,
> -                                              qemu_bin_relative_path)
> -    if is_readable_executable_file(qemu_bin_from_bld_dir_path):
> -        return qemu_bin_from_bld_dir_path
> +    qemu_bin_name = bin_prefix + arch
> +    qemu_bin_paths = [
> +        os.path.join(".", qemu_bin_name),
> +        os.path.join(BUILD_DIR, qemu_bin_name),
> +        os.path.join(BUILD_DIR, "build", qemu_bin_name),

Thinking about how to write this last line again, maybe it should actually
be "os.path.join(SOURCE_DIR, "build", qemu_bin_name)"?

> +    ]
> +    for path in qemu_bin_paths:
> +        if is_readable_executable_file(path):
> +            return path
>      return None
>  
>  
> -- 
> 2.37.0
> 
> 


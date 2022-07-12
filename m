Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888FA57294B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:28:55 +0200 (CEST)
Received: from localhost ([::1]:57770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBONC-0002Jp-Lr
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oBOIA-00047R-BD
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:23:42 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:37307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oBOI8-0003Pz-B4
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:23:42 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 9BF592B05A68;
 Tue, 12 Jul 2022 18:23:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 12 Jul 2022 18:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657664617; x=
 1657668217; bh=8FlRVxSbtBJ7Cpk5qU1QcastxbDfhqCD27gOB1Rd184=; b=c
 v0zs8T0Shf8KcfN4wYVIyX+9335Lp9SzZSSJ+RAFF2A0dH+Zu0sDxTtybAHxLiod
 OQplYQe76Lq1A/bVDNh3LYRZqx8nzX3Wy3KdJsbp7rmCaSWCITPYpAQbfzbcT+rF
 X0EufSFJrpOgHM9o+Yr79Zce8SZpjR4uEzqnRGAxLq96cKUkklWdPI1su3R/MELw
 YIZQAAeqMcISh3IxzkTerJ8tVXl+sLih9Z3CxxvyfPfhSGe1hu0S6aunURBUU90w
 go0paNt+j9lMdEhBz1hkr4pQlrGhypGVV48UHnu+U+q18eHAhXqfbvbpSB8KhLmg
 PT77Gh/PFy6cwc/8lViUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657664617; x=
 1657668217; bh=8FlRVxSbtBJ7Cpk5qU1QcastxbDfhqCD27gOB1Rd184=; b=P
 1B4CKKx59IQq3F9SsDRo0mAs70UBHHSqszP9NHM4qUAlomweyAVnzn21k2I5d9Kx
 eowFlB8GNcKI6X5P7GONp+2Hu/Sk0gVZYeeEyCIYcVSHrMrZiv7m1+t+k0gXdm6M
 G2+VWFNVUrIcSdhnihCgwEFEsTD4xNo0L2EMrC3PlxueVNXTZ/FXLbESF9fRlZ/9
 0pUI8aOkVYX/M3/u0d54ToV4Xhx6xCDR7C5ziTG8o2aDtl6FHLCzhV/HmHzMX0oM
 R8ivAb9OJTXDHtXAg6aP03bGJMwdygat0TYuUFUKJFfCQ/3JZFIQDQCRZ9BEJDwe
 tj5rHDqXImCV9ozUmIpkA==
X-ME-Sender: <xms:aPTNYvLu08G70Y1Mi1EWd1NjdwxsokFGcIaWzH3eqy6e3tkHK_0V5A>
 <xme:aPTNYjJF-FrL0hAjolwlRt5X_7kyk5UKWSwHjBLP8KAfyxJPzqes0EnNp_ov3Ko2I
 lwluNRgXXVQOqFdJv0>
X-ME-Received: <xmr:aPTNYnu6WOem1U7RkTOSdSxFw_42aAflyxUfEeUnhAzAc6Puyz64-hbXfwYV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejiedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:aPTNYoZUmRDnGsP18mJmqUyv8bRmcrD25M4hkHC7v_2nwe1oMJNbRw>
 <xmx:aPTNYmYlBS9dcdTTSJHEmI2_GUbQ6xugljR6TUA2mwMThBzDHpj2dQ>
 <xmx:aPTNYsAsuRPBn5H5aC_seYE7UhqagC3fwr35kl-8DAY13erJ14t4Aw>
 <xmx:afTNYtUQaurcKJ4ATS5vFFILJi08kO1mJjJPU6lG38MDgjyn5Y_aLWtzA7s>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 18:23:35 -0400 (EDT)
Date: Tue, 12 Jul 2022 15:23:34 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] avocado: Fix BUILD_DIR if it's equal to SOURCE_DIR
Message-ID: <Ys30ZrWne5IBpYQZ@pdel-mbp>
References: <20220702185604.46643-1-peter@pjd.dev>
 <f2fceb5e-ab0e-20fd-3549-a6086cec5215@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2fceb5e-ab0e-20fd-3549-a6086cec5215@amsat.org>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
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

On Tue, Jul 12, 2022 at 11:53:14PM +0200, Philippe Mathieu-Daudé wrote:
> On 2/7/22 20:56, Peter Delevoryas wrote:
> > I like to build QEMU from the root source directory, rather than cd'ing
> > into the build directory. This code may as well include a search path
> > for that, so that you can run avocado tests individually without
> > specifying "-p qemu_bin=build/qemu-system-arm" manually.
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   tests/avocado/avocado_qemu/__init__.py | 17 +++++++++--------
> >   1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> > index b656a70c55..ed4853c805 100644
> > --- a/tests/avocado/avocado_qemu/__init__.py
> > +++ b/tests/avocado/avocado_qemu/__init__.py
> > @@ -120,14 +120,15 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
> >       # qemu binary path does not match arch for powerpc, handle it
> >       if 'ppc64le' in arch:
> >           arch = 'ppc64'
> > -    qemu_bin_relative_path = os.path.join(".", bin_prefix + arch)
> > -    if is_readable_executable_file(qemu_bin_relative_path):
> > -        return qemu_bin_relative_path
> > -
> > -    qemu_bin_from_bld_dir_path = os.path.join(BUILD_DIR,
> > -                                              qemu_bin_relative_path)
> > -    if is_readable_executable_file(qemu_bin_from_bld_dir_path):
> > -        return qemu_bin_from_bld_dir_path
> > +    qemu_bin_name = bin_prefix + arch
> > +    qemu_bin_paths = [
> > +        os.path.join(".", qemu_bin_name),
> > +        os.path.join(BUILD_DIR, qemu_bin_name),
> > +        os.path.join(BUILD_DIR, "build", qemu_bin_name),
> 
> I suppose you are building as pseudo-in-tree (see commit dedad02720:
> "configure: add support for pseudo-"in source tree" builds"). OK.

That's right, thanks for adding the reference in the commit message.

> 
> > +    ]
> > +    for path in qemu_bin_paths:
> > +        if is_readable_executable_file(path):
> > +            return path
> >       return None
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!!
Peter

> 
> And queued.


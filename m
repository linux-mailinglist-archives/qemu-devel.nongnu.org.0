Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB254F2971
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:29:27 +0200 (CEST)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfV8-0008RW-FT
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nbfIj-0006Av-RS
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:16:39 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:37754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nbfIh-0001HU-SY
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:16:37 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A083B20779;
 Tue,  5 Apr 2022 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1649150192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvEOy2CTlglwrFmfjjelsJJvYsXvwBqq2ojcHMWkcvA=;
 b=Tz8nr8e5m7djl4kDQBQ5hYDSN/1vstQLWWe6p2dzaA++L/JEluqauGkQ7mPXH4IDJd9AgS
 SQMBBs2u4BnXy94qbIMaSOG2mQy1TX9VmjcXRzqMKqwbx40rK9RNR40AeAMT5nAKBA9us1
 cxusT1L5HNfzgDpvm9qhE3WMRKdR4ec=
Message-ID: <50204b1e-2bf5-8fa7-83f3-0ee8b9cc4ab5@greensocs.com>
Date: Tue, 5 Apr 2022 11:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [qemu.qmp PATCH 10/13] docs: add versioning policy to README
Content-Language: en-US-large
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-11-jsnow@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220330182424.3438872-11-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/30/22 20:24, John Snow wrote:
> The package is in an alpha state, but there's a method to the madness.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   README.rst | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/README.rst b/README.rst
> index 8593259..88efe84 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -154,6 +154,27 @@ fail. These checks use their own virtual environments and won't pollute
>   your working space.
>   
>   
> +Stability and Versioning
> +------------------------
> +
> +This package uses a major.minor.micro SemVer versioning, with the
> +following additional semantics during the alpha/beta period (Major
> +version 0):
> +
> +This package treats 0.0.z versions as "alpha" versions. Each micro
> +version update may change the API incompatibly. Early users are advised
> +to pin against explicit versions, but check for updates often.
> +
> +A planned 0.1.z version will introduce the first "beta", whereafter each
> +micro update will be backwards compatible, but each minor update will
> +not be. The first beta version will be released after legacy.py is
> +removed, and the API is tentatively "stable".
> +
> +Thereafter, normal SemVer/PEP440 rules will apply; micro updates will
> +always be bugfixes, and minor updates will be reserved for backwards
> +compatible feature changes.
> +
> +
>   Changelog
>   ---------
>   

Looks reasonable to me.
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ACB32CC14
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 06:40:10 +0100 (CET)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHgiX-0006Gm-2g
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 00:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHghi-0005pz-Uz
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 00:39:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHghh-0002dl-2E
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 00:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614836356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bn/17JWu88ubTIUBPEyJQ+hX4hI25yTN77TtgpQh2sU=;
 b=i2BYP884AyJOZgyk0QCnS5fLyiCptqVOTAokc5TL5mTWiiuNLRk989ppM39fu0zKHN42Mv
 r664CQuAoV6aY+8HVntisZlor4kTppSSGjX+XJiUlvZVlBBoiH219aR9MYkwY/xCJnojWA
 Esu4bRNmQKp2ndgeXxX/eWrfrxLGul4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-1nTy-j-aNeiaC9ErVANgcg-1; Thu, 04 Mar 2021 00:39:15 -0500
X-MC-Unique: 1nTy-j-aNeiaC9ErVANgcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E2031868406;
 Thu,  4 Mar 2021 05:39:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7308162692;
 Thu,  4 Mar 2021 05:38:56 +0000 (UTC)
Subject: Re: [PATCH v3 5/5] tests/fp/fp-test: Replace the word 'blacklist'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>
References: <20210303184644.1639691-1-philmd@redhat.com>
 <20210303184644.1639691-6-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e69b5a49-6932-2d5a-9dd9-29c604d964a7@redhat.com>
Date: Thu, 4 Mar 2021 06:38:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303184644.1639691-6-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2021 19.46, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Acked-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/fp/fp-test.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
> index 06ffebd6db1..5a4cad8c8b2 100644
> --- a/tests/fp/fp-test.c
> +++ b/tests/fp/fp-test.c
> @@ -123,7 +123,7 @@ static void not_implemented(void)
>       fprintf(stderr, "Not implemented.\n");
>   }
>   
> -static bool blacklisted(unsigned op, int rmode)
> +static bool is_allowed(unsigned op, int rmode)
>   {
>       /* odd has not been implemented for any 80-bit ops */
>       if (rmode == softfloat_round_odd) {
> @@ -161,10 +161,10 @@ static bool blacklisted(unsigned op, int rmode)
>           case F32_TO_EXTF80:
>           case F64_TO_EXTF80:
>           case F128_TO_EXTF80:
> -            return true;
> +            return false;
>           }
>       }
> -    return false;
> +    return true;
>   }
>   
>   static void do_testfloat(int op, int rmode, bool exact)
> @@ -194,7 +194,7 @@ static void do_testfloat(int op, int rmode, bool exact)
>       verCases_writeFunctionName(stderr);
>       fputs("\n", stderr);
>   
> -    if (blacklisted(op, rmode)) {
> +    if (!is_allowed(op, rmode)) {
>           not_implemented();
>           return;
>       }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>



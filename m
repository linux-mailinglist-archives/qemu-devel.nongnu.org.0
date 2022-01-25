Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C549ADF2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:26:18 +0100 (CET)
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCH9d-0000Zn-HQ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCGRu-0001uK-UJ
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:41:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nCGRp-0004Y7-Nb
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643096460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apcI5JPctFat4dF3Xa7QchGFqN5z/qlQWx9pXHjk4BU=;
 b=Au0Z/neX5BkNKfYBLp4obwY+x5aT1SKr0fUPRkpAzyd4dnSdO0yxEI70hzqjR6i+kEEcA8
 xmGp9mhJd7l/4k/eRDRkkdA6RXGbGYW28GD8TL4jymepE20swBTv3JUvRarxhMZ7BRUyIJ
 M7JS5b3mETZmFsr1k1q0fu78KsO8zkY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-kn-S-lj6Nr-XSzjfi-6NFQ-1; Tue, 25 Jan 2022 02:40:58 -0500
X-MC-Unique: kn-S-lj6Nr-XSzjfi-6NFQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 k12-20020adfe3cc000000b001d6806dfde1so2615611wrm.16
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 23:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=apcI5JPctFat4dF3Xa7QchGFqN5z/qlQWx9pXHjk4BU=;
 b=2yudrMLtAUVxQmIS8b7yLmA3QXWvJbLLxIYbs+PS6O0rylgOMpNZMpWQCCDEf1JOrV
 U3dcYTUgA61kgjrEFLwlRGDSdiWBaAoHhT1mzqRg5cu7Cp4U/jknxzeN0g8wtmDJTTzo
 Zqy6+CKcl9Y+EDHhcYhrqI62M9b0Gl7mjuuKnKPXMjLfoElg/E7g0Iu+hBpd8PPwb6iE
 VJt3KhzjRtOHPHWHmWW4I+HQP7CXRgZGqZN5MkhYLsWl++Q+F7cK4w6gh4RfaFrgbYWR
 DOmVFM+BK0WJJU+NRJApD99l/MtdmX6a6JRuE4eWvDDNnkONCsBVkOLQHePD538lZyVy
 gHYA==
X-Gm-Message-State: AOAM530Zh1w+fR9+G8l5D/hpeYo4dye5t09xb/aOHMHnZaZAPsK7zaSv
 YaTlUHf0l8C/DED9HNPiq7yypKlYuZyuUYrBq1mlZNcbE1ho1Di2YyoZ6BYZwzyA8A+sxheT33T
 Yy9Xluzxii9icXLo=
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr15860196wri.244.1643096457367; 
 Mon, 24 Jan 2022 23:40:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5P2C8ego6TT438+wxo/PSvaY1bZIEtUgmoI/qrFuXFyfpBo61XfAAT4NftFPIjddAzwNaPA==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr15860175wri.244.1643096457098; 
 Mon, 24 Jan 2022 23:40:57 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id t14sm1616964wmq.21.2022.01.24.23.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 23:40:56 -0800 (PST)
Message-ID: <38dddfd4-4ed0-ebe1-9c51-9f4e220db0bb@redhat.com>
Date: Tue, 25 Jan 2022 08:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 03/22] Makefile: also remove .gcno files when cleaning
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220124201608.604599-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: minyihh@uci.edu, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2022 21.15, Alex Bennée wrote:
> Left over .gcno files from old builds can really confuse gcov and the
> user expects a clean slate after "make clean". Make clean mean clean.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   Makefile | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index db9a788601..65e0d2dd4e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -206,7 +206,8 @@ recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
>   clean: recurse-clean
>   	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
>   	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
> -	find . \( -name '*.so' -o -name '*.dll' -o -name '*.[oda]' \) -type f \
> +	find . \( -name '*.so' -o -name '*.dll' -o \
> +	 	  -name '*.[oda]' -o -name '*.gcno' \) -type f \

My git complains here:

.git/rebase-apply/patch:15: space before tab in indent.
	 	  -name '*.[oda]' -o -name '*.gcno' \) -type f \
warning: 1 line adds whitespace errors.

Please remove the space before the tab.

  Thomas



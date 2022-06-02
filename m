Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F048353BC88
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 18:30:35 +0200 (CEST)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwniV-0000Qg-1q
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 12:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwneO-0006sY-R3
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 12:26:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwneL-0000a7-Qb
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 12:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654187176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktGGgzIhVBwVpyC83Hh+hpoSpC3LFcqjP9jbtZuIohE=;
 b=TfLk8iV0d5YQTEvbWTQys6P7ha9k+rI/fCT6+T6zzfj0annWhVI3GPI1tiWyjnHJTONMen
 YbiJuBtXPWFPicWQ76uUnuxij7oNU2dfkN87vBgBcL3293VVl+Or2jH8WjuCHf81aTKTt1
 wz+5aMe1Tvnoio+qnbTi71E4c5rXcNc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-U6wNM2TiMwaXeSQiImx8GA-1; Thu, 02 Jun 2022 12:26:14 -0400
X-MC-Unique: U6wNM2TiMwaXeSQiImx8GA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o3-20020a05600c510300b0039743540ac7so2632895wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 09:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ktGGgzIhVBwVpyC83Hh+hpoSpC3LFcqjP9jbtZuIohE=;
 b=s7s7DcySMEuAg49/e9XX4i0k1zhH9J0SUYYF9e3Eq9v2GiovNYcnt89b3Pu1wcqYm/
 QhkGBpwD8LPeEOEJUBbuqvHU4+BwMaT+cgFeayNDdn2zj2oxc7PkgYYlINgesZ3QHQpY
 N2dzP6zEsWgKXsCjbZbnit1A+YAPrQTDDHoV/nx9gghB4PTi1WJf8XdHSzzCK9D7f/WV
 bgNNLRPS0T5KdTGWyR8w2QWEx9RA4L6KLTvt207m7v1xeUMixwb1HIDAJXekCJ8ex4wG
 cAm1mwm7G4quvlkJ+zt7Om3ihspY4qKg5r90GFAAC9rXPMaxtY0kUX+XP+vIimf3nHiO
 ODIg==
X-Gm-Message-State: AOAM533df/qPwFQnYVxNZqVVfn1PqUdQsSKdyFXY3JhsNohukmLW9ubO
 G9dNPa8mZfCo6BeFxpeg0tmPEfS/PHLrN0YaCUEfL0196shjSHaYz82Qj1/b2tryM+PMXVVnfhE
 ZAYBFcYbHAtGQeDQ=
X-Received: by 2002:a05:600c:a47:b0:39c:19b0:84c with SMTP id
 c7-20020a05600c0a4700b0039c19b0084cmr13703322wmq.201.1654187173449; 
 Thu, 02 Jun 2022 09:26:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE0PvoboN6nVvxK+TBxCOdsi1ecVbfT0JU/NuDX52QJaSyIZQ7RuVkIAjtOA/dNfZvOtYBlQ==
X-Received: by 2002:a05:600c:a47:b0:39c:19b0:84c with SMTP id
 c7-20020a05600c0a4700b0039c19b0084cmr13703291wmq.201.1654187173206; 
 Thu, 02 Jun 2022 09:26:13 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-213.customers.d1-online.com.
 [80.187.98.213]) by smtp.gmail.com with ESMTPSA id
 e16-20020adffc50000000b0020fdc90aeabsm4722596wrs.82.2022.06.02.09.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 09:26:12 -0700 (PDT)
Message-ID: <bc3b9456-8015-bd6f-f738-c1f4476327bf@redhat.com>
Date: Thu, 2 Jun 2022 18:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 12/15] tests/qtest: plain g_assert for
 VHOST_USER_F_PROTOCOL_FEATURES
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220524154056.2896913-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 24/05/2022 17.40, Alex Bennée wrote:
> checkpatch.pl warns that non-plain asserts should be avoided so
> convert the check to a plain g_assert.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/vhost-user-test.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> index d0fa034601..db18e0b664 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -980,8 +980,7 @@ static void test_multiqueue(void *obj, void *arg, QGuestAllocator *alloc)
>   static void vu_net_set_features(TestServer *s, CharBackend *chr,
>           VhostUserMsg *msg)
>   {
> -    g_assert_cmpint(msg->payload.u64 &
> -            (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES), !=, 0ULL);
> +    g_assert(msg->payload.u64 & (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES));
>       if (s->test_flags == TEST_FLAGS_DISCONNECT) {
>           qemu_chr_fe_disconnect(chr);
>           s->test_flags = TEST_FLAGS_BAD;

Why this? commit 6e9389563 says that this should not trigger for code in 
tests/ , so I wonder why you ran into this checkpatch warning?

  Thomas



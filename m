Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F295622F9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:20:23 +0200 (CEST)
Received: from localhost ([::1]:33442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ziA-0003C7-Hz
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6zew-00019T-TS
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:17:03 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6zei-0008Mn-DQ
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:16:51 -0400
Received: by mail-ej1-x633.google.com with SMTP id lw20so40894543ejb.4
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I5MuolvGSiIzvCT4TVz9iRUD6wjgYiFv1NnTg1plSfk=;
 b=jLRe4N3LxQhULK8kN65txC+jL0HQ5s8DBhfThk7xsqv3O7FKhnjnRfUzKzQYPm7dRa
 TqtiIlc0T0mIC+0g9ZWtWNXKZawBfZ8YKorSxj5Ck7eZBRWHKEwhasXKLr4wGFBvNoz/
 E3+8jXpBzFJB1sWVxub9cSekWLECV8Hhk9OEe+BEGloJm/WdQU31zDE9omF/fCpkBi/B
 FtKUR85JJ1nfoIz8ryO9dXeqprEi41pvtLjaSI5sTiIWYXMS1xAeYH4PiBbpH03wJZ+q
 x4cQy9CV2Hy2MCaWkP5vvrjjstAOVt+6EMPHbQundiAF7qLFbXpewQyFvOxSMyV6wNad
 +0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I5MuolvGSiIzvCT4TVz9iRUD6wjgYiFv1NnTg1plSfk=;
 b=TrefKdN1vwy9yxKuRM1s5NQgeXYtWUhpdnlujfXt7TOvUppKeeiHzp/JCyMoVTioHA
 T7CdLvQ6vjsMyZOrMBkbk7RsT8mvS7lTWGowjjmTGcSRYsKBFNXHEi9JxdpNfngVzXTf
 2oEcKHKlcFAokpw++HMWIg8s1jW6aG7upCZ3cj3f+qO4BUm0B7xNmBCx5Lhg0XjAKxbS
 84Cr4vOqZKyAuc8A4orXBEKIazgSkBux9Va+53DuiX2zEmunNa6CQZTSZkH2oublTsiH
 2zZdE4dNYrKNL8IBwX0koG1G2Y9CrMLKwnRhp8n9OOoPHh8oI5nYOqrxijima3H5d8Gd
 2fgw==
X-Gm-Message-State: AJIora9dggNLPI2637isIxW5ucUPAwGF5HC88CpnwednHpVTfRYv13v5
 F1mHgSVZv6msHkNmDinov078GkJGRLHE3/t2HP3K+Q==
X-Google-Smtp-Source: AGRyM1v+i5nf7BaJ+Gyw3x4RlJ1K06dq1bkg84rQ1DfjTvDUAwq3cLjjzy4sAZUfkkqk8iqLniorN+TeaFRJY8TWnAs=
X-Received: by 2002:a17:907:97c1:b0:726:a646:3b95 with SMTP id
 js1-20020a17090797c100b00726a6463b95mr10098325ejc.253.1656616601788; Thu, 30
 Jun 2022 12:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-11-me@pjd.dev>
In-Reply-To: <20220630045133.32251-11-me@pjd.dev>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 30 Jun 2022 12:16:05 -0700
Message-ID: <CAMvPwGptKGEkDf2MqED8EatHoY-szncDmmJxQKvKDj3YhrbCig@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] hw/sensor: Add Renesas ISL69259 device model
To: me@pjd.dev
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 zhdaniel@fb.com, pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=titusr@google.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Wed, 29 Jun 2022 at 21:52, Peter Delevoryas <me@pjd.dev> wrote:
>
> From: Peter Delevoryas <pdel@fb.com>
>
> This adds the ISL69259, using all the same functionality as the existing
> ISL69260 but overriding the IC_DEVICE_ID.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/sensor/isl_pmbus_vr.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> index 799ea9d89e..853d70536f 100644
> --- a/hw/sensor/isl_pmbus_vr.c
> +++ b/hw/sensor/isl_pmbus_vr.c
> @@ -119,6 +119,18 @@ static void raa228000_exit_reset(Object *obj)
>      pmdev->pages[0].read_temperature_3 = 0;
>  }
>
> +static void isl69259_exit_reset(Object *obj)
> +{
> +    ISLState *s = ISL69260(obj);
> +    static const uint8_t ic_device_id[] = {0x04, 0x00, 0x81, 0xD2, 0x49, 0x3c};
> +    g_assert_cmphex(sizeof(ic_device_id), <=, sizeof(s->ic_device_id));
> +

This generates an error from the checkpatch script:
Checking 0010-hw-sensor-Add-Renesas-ISL69259-device-model.patch...
ERROR: Use g_assert or g_assert_not_reached
#27: FILE: hw/sensor/isl_pmbus_vr.c:126:
+    g_assert_cmphex(sizeof(ic_device_id), <=, sizeof(s->ic_device_id));

otherwise, LGTM.


Titus


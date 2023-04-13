Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20FF6E167B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 23:27:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn4Sd-0001sD-Aj; Thu, 13 Apr 2023 17:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pn4Sb-0001rQ-G2; Thu, 13 Apr 2023 17:26:29 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pn4SZ-0003KM-NV; Thu, 13 Apr 2023 17:26:29 -0400
Received: by mail-oi1-x231.google.com with SMTP id j12so10917125oij.3;
 Thu, 13 Apr 2023 14:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681421183; x=1684013183;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nLYBq2/EhiCBDzuVVOEoOleyihIQAZhh3FAOuqevjzk=;
 b=SvQmbV3dyhu0kZBcTRiEmXBxX3uzWLI7SBpdJ1g8ftJAKBXdc0bOwuq4zHD6zXy1ev
 0PA+7OWaS/d50tSD7x5ftyrqhjiqCS2DEVe5zFVBGTMsLb9xxNukOZMf9lPiK/XnjCBI
 kD6NrKte50TSN2hZ+/H1Hs/cvncEmv2/xmKEb2oMB3jhU+Bi0HXb2Ub09z6qoG39gmsx
 EXiFHIrhwHGSZuvTl5xP8vKPrDbmjT3Ob1lGv0ULVVKMHFH+PwU4wxY+tPIQhUonMsvU
 W3pihb7mer4z+bGLY9Nw1QD+PR3DxdlVjrRkgQLU4ktYa6jLz7acPkRI+juyBrRvkwLG
 7eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681421183; x=1684013183;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nLYBq2/EhiCBDzuVVOEoOleyihIQAZhh3FAOuqevjzk=;
 b=UL9tT5uK1p7DcAgwYLxY9vsT5dVa/InE/RUYP9fwaAgMcrNSdfArKoxGM2WhjlZMli
 d2kbFKTpDyT2N9JZWsWyeQcgTRIZay1dRd+Jq/1xKeatMqhd3GGkq2WrsxvwE7xDYvGh
 ZUai2oAmg1Dht0lRxToYeZyBDIt/c1zufT99A5gcp1oEvMDj5RkIG0YvtNqru5TfBndu
 31iacHF4YNGe59hZZtEfVXA9Z5Ju5oFO7c+b6sA3Qcs9+4Ch3Fi401uCDK9/2RFsgYqt
 EBGRCKjdguPXSkX2fH+JNd++Dsxy7gcNsqp2LcoWdm8+Q8G+NfxyuPS9odOseDgis77w
 ljpg==
X-Gm-Message-State: AAQBX9dCO6unvU0/eCo2tn1jpSPsJRfm00RjXhBygJuJLwxu3dR4V73H
 8xZ9ppbn8J/1qo9ghiiFrd0=
X-Google-Smtp-Source: AKy350Y9BchijpdMcPbV5xD4x4gdgP5XK0YsNF1xT2UYHl+bHoVPhaRnKr1jjZSYGWDSAPlBG7dyNQ==
X-Received: by 2002:aca:90a:0:b0:387:1a46:82c9 with SMTP id
 10-20020aca090a000000b003871a4682c9mr1598407oij.52.1681421183531; 
 Thu, 13 Apr 2023 14:26:23 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a4a5301000000b00541b86960d8sm1026583oob.24.2023.04.13.14.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 14:26:23 -0700 (PDT)
Message-ID: <659ecae8-3129-ab87-43cd-c6816c11e370@gmail.com>
Date: Thu, 13 Apr 2023 18:26:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] hw/display/sm501: Remove unneeded increment from loop
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20230405161234.6EF0A74633D@zero.eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230405161234.6EF0A74633D@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/5/23 12:57, BALATON Zoltan wrote:
> As Coverity points out (CID 1508621) the calculation to increment i in
> the fill fallback loop is ineffective as it is overwritten in next
> statement. This was left there by mistake from a previous version but
> is not needed in the current approach so remove the superfluous
> increment statement.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. I'll send it out as soon
as 8.1 dev window opens up.

Thanks,

Daniel

>   hw/display/sm501.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index dbabbc4339..0eecd00701 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -901,7 +901,7 @@ static void sm501_2d_operation(SM501State *s)
>               /* fallback when pixman failed or we don't want to call it */
>               uint8_t *d = s->local_mem + dst_base;
>               unsigned int x, y, i;
> -            for (y = 0; y < height; y++, i += dst_pitch * bypp) {
> +            for (y = 0; y < height; y++) {
>                   i = (dst_x + (dst_y + y) * dst_pitch) * bypp;
>                   for (x = 0; x < width; x++, i += bypp) {
>                       stn_he_p(&d[i], bypp, color);


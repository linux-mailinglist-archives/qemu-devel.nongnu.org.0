Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B2356BA5E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:12:12 +0200 (CEST)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9nmF-0008Jj-EG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9nkG-0007Hi-VX
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 09:10:08 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9nkB-0001sv-OY
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 09:10:08 -0400
Received: by mail-pf1-x434.google.com with SMTP id g126so9076698pfb.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sXeSs2lMyDHIHjvDEJlIt5IxPjmCWcu5GrsyuDU8oHk=;
 b=CnbUffA8k3f2h5whzWhGU+9xaiSFwTbnMDnen5Pli+IMNOVi3vVuj9w8Di0KTy0a3z
 yB92YXayPVxqq9hRsSj7ACpqNsTh4VVjxF29Z53o8KSKwZfaxLo0iWevXZcWv9/8fCUf
 H7fPqx9HBTn1iE7lCK+1tcEjyB6VVTNTnPMt/ISYe5ohiUOLOUhPjHPWs3v4ms4VpmO4
 NMChEDw2xVgjfMLb2dIp69+3RIPBv5FMW6Ibg/WkQcWulhnDZrpJ3yNBvuAYdatP/px4
 7vaPjNpn3Yw+ivlTxNey1YjWDwUpUx4zBeuiM5B7e5lGrEcXn7yIN51poMXmixiGWWog
 oRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sXeSs2lMyDHIHjvDEJlIt5IxPjmCWcu5GrsyuDU8oHk=;
 b=boeuLuULnwXj/Rju1Z2eBuNleBiI3hTrECrQO/i6mGaN248ZALhOnmUZlgifgI4rIs
 G9mnpb2oH8wOfaCXlHC9QSFxClY2RIzzONj3T2YOft4oq2iZbviiWoeuQ+hbnOmXnjrT
 DAXYGNI5jO8mKtPQtkflAjsexxcB/vL4i9xhjPPjA8Fkj0ZPe1vNJkjIQk5BPh2Or2+X
 qsRu8fNUI3q1JkcUt42wO9R5lNpc7rsXm+1pgej8tVx+JGrTedX+TvV0GYI1AUuwyrN6
 NZbGbFviUpqvjkGMoY6/fxa9iSnNCSvobT7hNzPCxGSWZb0uQlhm4QOSwpm/dEi/si9q
 +5cg==
X-Gm-Message-State: AJIora+EjM2OOwzlXHMittVOeHZOCEpVwhTGFgjvSjnkw8EYx6pa1Dx7
 XnucwVoXMdQ6HNpd5Nb8cBVgbg==
X-Google-Smtp-Source: AGRyM1tDqpo0ZRXFFfFBsimTT92L6sgJ6BFaboR/fcq2CrYb7pjho6FXa6N7mov6o9pSEWE6Rie68A==
X-Received: by 2002:a63:3fcc:0:b0:408:c856:dd6d with SMTP id
 m195-20020a633fcc000000b00408c856dd6dmr3319293pga.354.1657285800546; 
 Fri, 08 Jul 2022 06:10:00 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a170902869400b0016a565f3f34sm1803034plo.168.2022.07.08.06.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 06:10:00 -0700 (PDT)
Message-ID: <72296629-0870-9c69-21e8-aa18881ea277@linaro.org>
Date: Fri, 8 Jul 2022 18:39:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Intermittent meson failures on msys2
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <c27c93e9-c6e9-1d12-8b45-41c34065a977@linaro.org>
 <CAJ+F1CLQ6Y-tzcjwQeL=EO21+v+_49F85E2fnEcN170Gb89kjw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAJ+F1CLQ6Y-tzcjwQeL=EO21+v+_49F85E2fnEcN170Gb89kjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/8/22 18:11, Marc-André Lureau wrote:
> My guess is that CI randomly fails with "too many opened files", as I have seen that 
> regularly on various projects with Windows runners. And here, it's probably reaching 
> limits when running python/perl scripts simultaneously... I don't see an easy way to solve 
> that if that's the issue.

If that's really the issue, with no solution, then we should turn these jobs off.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFA2564CEB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:21:43 +0200 (CEST)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8EWk-0001l8-FQ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EPC-0004G0-8i
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:13:54 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EPA-00011k-Of
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:13:53 -0400
Received: by mail-pg1-x536.google.com with SMTP id 9so7939607pgd.7
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gc+ZRyNCEvA/BtnfBEOoK5hV2wIgYsB2YMF8rPH1cPo=;
 b=EYiaQ6g8UKiC5qS26nGb4redG73jIMLnUv+srLC75afh977X7WB+tf6yGGNBzrdxzZ
 0HPQYPcpvQmTyQOHLY7gJDG361PNtLb4Bzjo3LH2SGQWNBp/Z0XaAouQrq0glC8CgUmv
 7z3slN/vp9/tQIQw95W/mVltXUZ+CEQCy7a3aqnYqRFhcBWjruvxxmSvyj/kFfJ4fnX8
 6tMs9OwWLD8fymNb5R5ODLd7tpYPAfSNykpfgCNmYgVon1kvYFQPOR5Xw3BIR3b1FHlj
 yFyyQXmbf79Ay8y9QfLbWj5VCxaHZBCY4TAfgXZ7hcgekCbrg4rUfnMVME2x/JSZKBmn
 amag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gc+ZRyNCEvA/BtnfBEOoK5hV2wIgYsB2YMF8rPH1cPo=;
 b=HAJACJYspdPyqt8FAAgxD0EstzrM3fpN6Vn1HSD/fFQd0/RS8W3MhdlEEwvH6PgwCx
 3Xdcy11SUoiDf9itbnAHLLi4SRHRbb+12FQvBwpcUXp3wXHVqdqZXba5eUx3ZZqNLzUN
 f00CeBZNAPGSFDXG0IwNp5rrKlnPU2UMg2fttbQjBJyTiP8PwS0uKTu4D17avBik7IW+
 rZjXP5xHvlWOy/Xo4nJUfyTg5TYcW+Zc7Y7vDWx3tkll6CksUvHIu9nnhb+Tc+vQ/LME
 01MeNn2FvdZDxmDi9ZWM1ybvhLT/6smp6g39AuGax4ZTKH6Pfp9LIO6zH3DwzKnYsYjh
 nORA==
X-Gm-Message-State: AJIora9ViiHFZaMwAxFZm+PpABgbl7BrCA0+aGA+p1I9GZ2fu91ouW3I
 Ksa5ZOyOnFv1/wgo4cA+hc2LqA==
X-Google-Smtp-Source: AGRyM1u545juHefVJHmrFc3TG7/uEa2nZzvvWs4gLdhnsGqoDRPPYSX/CyT2HRk9+JVE02LqMzw9xQ==
X-Received: by 2002:a63:cd4e:0:b0:411:acda:d3d2 with SMTP id
 a14-20020a63cd4e000000b00411acdad3d2mr17492101pgj.487.1656911631323; 
 Sun, 03 Jul 2022 22:13:51 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a17090a740600b001ef8d2f72fesm405789pjg.45.2022.07.03.22.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:13:50 -0700 (PDT)
Message-ID: <49262a7b-fdde-e36a-66e0-a51cc6093f5b@linaro.org>
Date: Mon, 4 Jul 2022 10:43:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 02/11] hw/rtc/ls7a_rtc: Fix timer call back function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-3-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/1/22 15:03, Xiaojuan Yang wrote:
> Replace qemu_irq_pulse with qemu_irq_raise in ls7a_timer_cb function
> to keep consistent with hardware behavior when raise irq.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


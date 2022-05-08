Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2987251EAF0
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:38:42 +0200 (CEST)
Received: from localhost ([::1]:46378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnWoj-0001v7-AO
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWnv-0001Gi-Fu
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:37:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWnt-0003Kq-Vr
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:37:51 -0400
Received: by mail-pl1-x62d.google.com with SMTP id s14so10953369plk.8
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=FzbQleeMBpMlHiPYB24eVCajsAxDP/2Rbk+zVmqoJPQ=;
 b=H2pfXYxpadygn0kcZRtK398of+53Bb59AJS3O11z+Cf5V4ZfSHtyEKMRRtlN/K28xT
 S4WKNWMhGWNJ/fVOATActJT74Zp5+N1YXjWH+BOQYuMJRUGU/LibWH3aR0uADTbwTHeu
 zYjxUHXw3YufBdc6I4eJ3TboZ2d+dxbtNclZK09QX3CD8rOkscDcqcfdKXopa2vXNLUh
 q7rrYvreUZHB4+p/ZMe8fhjIYEKCCKtcWft+y2WxGE13A2z046cI57Knzgr5mNES6cGT
 cXiiisYtZhpNiSML0EjiiZhwAOh6wMByDRKNxWOMgJL+oioE1DQcANQtYqgYZFlYvbYm
 QD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FzbQleeMBpMlHiPYB24eVCajsAxDP/2Rbk+zVmqoJPQ=;
 b=0ktFqUKHJy2vn7pBX2opZxwHubx1/6iEC1bR6fnFNgHoiljDVdubGKM6aR0JRjpYae
 E0Oyo6rCoA3Ud/3zZf3ECkJh29BHjrmijIKSkD16i4nOzoRWM0dsDuFhVlHc88cqiDR+
 OWhnmDSRyBwn+IeRtDUAJ6HLuPIIhe7j2wvcEGpel0hQfqWIJk+ej4ehTr+cSFy1QWRi
 bg3u0qUa+ekUP5Bq3yMpxUCHjFv6T2spDAsB/VPOmjrbJEQG8H29TxKQy6Eqwqa5vYCD
 yytOwgq8Wqv82xZHqK3bzrHeq1aakvy+KxOJiV1v7iy5PuxsdaT4bz8KNNbOL+7kA4Fp
 CgHA==
X-Gm-Message-State: AOAM530s7V5lbRkRPMXbqDG4AjttL+dyqgBUOKsu2DLyuIkhVSxvLI9s
 FR1jrkT0GDvPhZGCC6WyAFI2kA==
X-Google-Smtp-Source: ABdhPJxdK/7QIcsNH0Yw/cK7bRDjJfQH4dwu1zPouK7rI977gGevWVmZfaSCjOiXF/cIyPQO0SLUDA==
X-Received: by 2002:a17:902:9b98:b0:156:52b1:b100 with SMTP id
 y24-20020a1709029b9800b0015652b1b100mr10389149plp.174.1651977468739; 
 Sat, 07 May 2022 19:37:48 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 x20-20020a62fb14000000b0050dc76281cdsm5838491pfm.167.2022.05.07.19.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:37:48 -0700 (PDT)
Message-ID: <360f5814-9abf-e699-bd69-2efa6725e8b7@linaro.org>
Date: Sat, 7 May 2022 21:37:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 33/50] lasi: move LAN initialisation to machine.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-34-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-34-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/lasi.c    | 7 -------
>   hw/hppa/machine.c | 5 +++++
>   2 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


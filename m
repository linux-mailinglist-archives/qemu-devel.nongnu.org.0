Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F951EB27
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:56:34 +0200 (CEST)
Received: from localhost ([::1]:57210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnX62-0001di-29
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX31-00083U-0Z
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:53:27 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX2z-0005Qt-BW
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:53:26 -0400
Received: by mail-pl1-x635.google.com with SMTP id x18so10955786plg.6
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=5iU5gxtyL74HYWfE3pHWnUgjkviZDiG17hO0HepnaBQ=;
 b=XhsB947Ae588R5Q+7EJWPd1wOSgk8JUuBXMDQD4NCXPOBEM/zOnJpfd55mwaHrSAn6
 DGICXBrxZG2JInWz3J2uahW0yYb5xjTRLBvTdjdfW0raqakNYaMmoNSIWY50CFnaG51g
 IFX9xuEjPJmmHvOIpCI0taKscV5BJzsecJoBNsAnRrovscr5IP0FG12fGTT+tQvzLvww
 LgDSYXGIz6veA7c7wbmqx3AvRp1MR52TJ9m3aq0HAtP+lOeVE0PHUal7vTRQF1wpy1Ic
 +ErsRIYrZljwOiYc782zJu+e2BYAjABcohA2gdKpskQHDlkV/hxXvkoI0sXAT7SARhcM
 zAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5iU5gxtyL74HYWfE3pHWnUgjkviZDiG17hO0HepnaBQ=;
 b=GdJVKI4kHqlYgOMlm0AnIiVcDOZvl07GlbKOXbib+VxCbtX4dBOZwvUU/vZZ/AxWO8
 Il9S9XoTonTFHiK8krcjL4Zf8TzI6vLo8ZxxMetKarNQykCKYPnixZZsn84q3u5Ap/9E
 DYZae0XuyMh3dRo8zsFS7kuuoO7y4Bu3czxcFJRng5Z6XHBHG52Ocbbk3cLa2oF4/7PW
 /n419E20Coj4OWmRFgIzxnm3jJfmxB4JDmCbZSOkgfEOactVaJAlw18qV+yNf3ClG0Mj
 fn2rMoFVA/YnK9KsILfRqr2OP5XV51kEzOCJ1dk2Te+c1P9DYIvTRk2HYY1xCYekW0DK
 EV5g==
X-Gm-Message-State: AOAM532cMNGvQtM5zWnsPujHSb9hLSiJXMDMVWlkKhFedWzDmzczm0XS
 O6urvDo7E1gJucBgE0SObi8o4w==
X-Google-Smtp-Source: ABdhPJw6yaHjcjmuBWoMOF8CShIMcs/DV2/fGArI3+jlCAojFUweP7Fr+Fx/hilx+LHtKln/60CxrA==
X-Received: by 2002:a17:90b:1c04:b0:1dc:4dfd:5a43 with SMTP id
 oc4-20020a17090b1c0400b001dc4dfd5a43mr20302191pjb.160.1651978403982; 
 Sat, 07 May 2022 19:53:23 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 r10-20020a170903020a00b0015e8d4eb21bsm4262869plh.101.2022.05.07.19.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:53:23 -0700 (PDT)
Message-ID: <3e90e509-b2ab-e026-bf6a-f4f8d5b75bb5@linaro.org>
Date: Sat, 7 May 2022 21:53:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 37/50] lasi: remove address space parameter from
 lasi_initfn()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-38-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-38-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
> Now that all of the LASI devices are mapped by the board, this parameter is no
> longer required.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/hppa_sys.h | 2 +-
>   hw/hppa/lasi.c     | 2 +-
>   hw/hppa/machine.c  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


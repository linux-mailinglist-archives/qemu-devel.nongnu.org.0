Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5173552DE0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:06:45 +0200 (CEST)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ZqO-000844-UR
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o3Zoc-0007DR-OL
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 05:04:54 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o3Zob-0001S1-8x
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 05:04:54 -0400
Received: by mail-pj1-x1030.google.com with SMTP id f16so11083967pjj.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 02:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=87qrlMPfD7KC3ZW5jZfyFYQwLsDffab9luG8oBhbw+o=;
 b=pyiq52m80MdD7gneTWGUIZa4mAqgqFzMQ84qRFLIybqmqsVJN12GkSgNS1q1bO33nI
 ayrXlyqiqKhlXVJjpgcBv3QRk+FyGXg53RLHT/OJ50RRpddGmQFSEXgdCMz4nLcqex/J
 zJFlpXGg47QDPLcAY2frjdaQK2Yve5/P3VlPx2DXSzlnbjkZsXWiqLJDYOQy4Gs17uce
 8s856q3jjS1rXiNaPoflYkG9bFTjwNkOHfI9AF2sDiDPBFgKCrv2757eCbomE2qhhlcs
 yby3f6Ako7aZ2CDD1MdE0dF9ZwCSyGHclaDpD+IKugZBKsOjlPvhIYuGdMd+OP1U1TA/
 DxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=87qrlMPfD7KC3ZW5jZfyFYQwLsDffab9luG8oBhbw+o=;
 b=e3DaLgDXjI1gsKmwH7TNaRSwu6MSUyMA5ZZc3kWNkTPPqYa8eEpMec1PgxC7tzEaRE
 hvy96Xm/TVl6R0b9miahBApytGvgEMGmfG5m4omNAwYkOrE30HawSWAGeP8ugdL0aqGv
 +HW2pxh6m1X0c7KBz/IGVuUsBAn5x/PLY1Cyo3Uzf+fWJkKTM3hmLRABfXz+86hLlSnX
 yYxXE2ZnfIFTsS0Yy0pqEmOtk6w9NYRLbFNrDMf/JQv63YXaNjyxj3j+A/mvfXYnwvg+
 J0Zg3ijNgbmdK2wlYaAPd6MeoM8sOp0n0k/DQY3Z29Tv1bif7Nja29JabO2re6SYbtrE
 XMVg==
X-Gm-Message-State: AJIora9gS1d4sNCoxUKus57QEAPwcjSo2x5uN7kC2SCHQUM2TcuvMXo4
 caSTASxFGEVWbd2jLc3CvWI=
X-Google-Smtp-Source: AGRyM1sNWJLCQAmX6eBzDCQgMXZG676NX8n+fqNfmqWxhQDtTDsewZodFwaNWs5BeRnF6wupZbEv7A==
X-Received: by 2002:a17:902:cf12:b0:169:f241:65ae with SMTP id
 i18-20020a170902cf1200b00169f24165aemr23619790plg.107.1655802291654; 
 Tue, 21 Jun 2022 02:04:51 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 iz18-20020a170902ef9200b0016a275623c1sm3344444plb.219.2022.06.21.02.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 02:04:51 -0700 (PDT)
Message-ID: <cb947bf3-1c8e-a63f-d90f-b3e81d7eb51d@gmail.com>
Date: Tue, 21 Jun 2022 18:04:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] ui/cocoa: Take refresh rate into account
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220620202921.21062-1-akihiko.odaki@gmail.com>
 <CAFEAcA-xUnoM9NSuqdgx6i3n==fk+Uxr3_5dk3hqdWvucwZ6oQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAFEAcA-xUnoM9NSuqdgx6i3n==fk+Uxr3_5dk3hqdWvucwZ6oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On 2022/06/21 17:51, Peter Maydell wrote:
> On Mon, 20 Jun 2022 at 21:29, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> Retreieve the refresh rate of the display and reflect it with
>> dpy_set_ui_info() and update_displaychangelistener(), allowing the
>> guest and DisplayChangeListener to consume the information.
> 
> But why? What goes wrong if we don't bother to do this?
> 
> thanks
> -- PMM

Regarding dpy_set_ui_info(), it depends on the guest. 
update_displaychangelistener() would change the frequency of the calls 
of the DisplayChangeListener.

I think it is obvious that delivering the refresh rate with 
dpy_set_ui_info() and update_displaychangelistener() makes sense, 
considering that those functions actually exist. They shouldn't exist at 
first place if we don't have to bother to do this.

Regards,
Akihiko Odaki


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A05629E40
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 16:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouyCy-0004NY-26; Tue, 15 Nov 2022 10:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouyCY-0004KC-3C
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:50:18 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouyCW-0002YQ-1N
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:50:17 -0500
Received: by mail-ej1-x630.google.com with SMTP id y14so37086820ejd.9
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 07:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z8Amn4wlCWSmwyTMb5KbZC4LNC9nUFj+alUUHvoUfPI=;
 b=Qw5kptD2nKlrlqAKLuMsbGFcUcqFYiX2gbO1rGr6PgMtFlfB6iyHZ/Oe60Cae11/n+
 3cH3ro4Y+r8fjR+SkIHFjGFDmYAy+xAJ3O+ZHBpf3kHmlVkNSGzpRqZCRCNCUMyx29eT
 DQVo5dBnQYctR8i040821Bdm1cK7qDMNHQ2623pdR1gqDqSuC4W7MHzGcyvR5mnwwEui
 zKWHg9ASeEkhxmn+r2Ip2Kuxh9efAN7A0GobjsxI1+0c/PzddWJFWU54M69XVkc+N4IM
 d+bnGS9lhdJGMOQ06PwdT9SXBXZklOEjDo2+jNyZtqWHX1ndE49E6OEpOUWtv7heuIV/
 DfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8Amn4wlCWSmwyTMb5KbZC4LNC9nUFj+alUUHvoUfPI=;
 b=JZZwBexceTdShV9+Ybf51zrq3ay59kLcRsx+wqoNIExbAWg2i/XcJllsG5xwoA6xX3
 nxWTMhBKF+ZvPgvEtUU01h5+wXmQ4fhTSs0TpYnd7mnySRi0CG8fKrcBjO/7OOQF73St
 uL+2FHqL/F+LXfCcHYPidmskcDJXzlsex1E8qt+9sbQqjaRoh6CzINgMR5U/AV/8IrO7
 Tvc20tN8wquXWD3GLxac9WE9KC5Gxlf2p/FOfSUlRJxq8ZB3BsVclLmagQaJMImjBElB
 y7QWKf5jGe9GR6a5Uoe2693RUrNXNBtb+XHAGdrONTfT0koksfTFc+wpybRIRgMgN5l5
 4vYw==
X-Gm-Message-State: ANoB5pnCjVwKAzIOU+CfH3T/CrV/hR+aVEEdpj1431BrKPRtUhUczhVG
 s0fidAG26kR9Z0ugWiZ7Lq63pg==
X-Google-Smtp-Source: AA0mqf7tZ5qc86W2q/VklxOF3f0KYjmpLrTrW98KwZ1KSPU6qPyklxGRG+2iKZPCwns7du+nk+ZiaA==
X-Received: by 2002:a17:906:66da:b0:7a5:f8a5:6f84 with SMTP id
 k26-20020a17090666da00b007a5f8a56f84mr13860617ejp.569.1668527413673; 
 Tue, 15 Nov 2022 07:50:13 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ek10-20020a056402370a00b00461cdda400esm6372024edb.4.2022.11.15.07.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 07:50:13 -0800 (PST)
Message-ID: <c0f160c6-b0db-e518-bd9f-0328ddaa9278@linaro.org>
Date: Tue, 15 Nov 2022 16:50:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2] m25p80: Improve error when the backend file size does
 not match the device
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
Cc: Francisco Iglesias <frasse.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20221115151000.2080833-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221115151000.2080833-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 15/11/22 16:10, Cédric Le Goater wrote:
> Currently, when a block backend is attached to a m25p80 device and the
> associated file size does not match the flash model, QEMU complains
> with the error message "failed to read the initial flash content".
> This is confusing for the user.
> 
> Use blk_check_size_and_read_all() instead of blk_pread() to improve
> the reported error.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/block/m25p80.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



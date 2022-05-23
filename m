Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728DA5311B2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:48:53 +0200 (CEST)
Received: from localhost ([::1]:57366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntAIe-0003AF-JY
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntAGR-00006c-SU
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:46:35 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntAGQ-0007Tn-Ac
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:46:35 -0400
Received: by mail-pf1-x42e.google.com with SMTP id f21so1710187pfa.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x4whsvHHzJd1KjpUglWwL+aC6RFzt74m8dblqhAMZ4E=;
 b=fYs0t8t9qnsCdcnvSLV0wiE92i3imAvEAugkz4/n0/u0Q58M8LKrbArkAdh5JmrVrG
 IqFYQdu4lyUUfD2fjPJApLi2o30bgUBsotgxw8fdfljwGtUsFsu1FJGOZl1MuFxTzd4f
 Ul45DfCf3SBv/euJhg/ujAISoGWyNY2Amu128nTan0Z3iQm4dOLlFAtevGPWXn5JrxkV
 QJVObl0UA93neu8On0i4+RjWh7nUznWGaHJzd6jQ7qQPwrXZvYPj//X+J6C+8uXZKKB+
 rZ3e7/+FhbU2BVg5ddKeqN/4tXj/33HcPEhMfTQrhItubaQx4IpirH3ASINtaiR57NwD
 ALTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x4whsvHHzJd1KjpUglWwL+aC6RFzt74m8dblqhAMZ4E=;
 b=yEt9fshKXSAS5TxHoXdZzWf2SrT2iidbYnEtlytHUaGrbmLfbrrNIuFXuXKGOQNFsk
 H2GzY84grZbfR/BWeRjcfiUFQySc2Q1B6F//KkXyB3ZqeQBt/kDMscqfGB0umwYCT0RX
 qbO3jnvxVut9Z/mylB1/U25pgSTAumvrSjep/iN6c2Y2dAFOjhBw5MIXERdWqAyOoIWR
 7/K8ctYtn2WoG1Zv5FqdUJbiP/QakV2zaotmdqPf8EKxVXhYaBO99ccuEnKYJgl9tUAk
 RlFNprn+v2yTRBLav5/R6eVlXTgg8cko/T+BeElgBLbEiuz/cMTQJf3Xooq4XzVBApWm
 p9Tg==
X-Gm-Message-State: AOAM533q970eM5u5rs8G37SBvSOAxfGXoYbd+aJ2OdGpVH63+TDJUYot
 p9yfGaWjjKaKlkJ5aKvWf0YNWA==
X-Google-Smtp-Source: ABdhPJyuNxSHbLwGZXzlHDztGtMTuOJxF10InETi/90t7vbTVuuVOD54GxjJJUN0RsMT9uoEOGJ61Q==
X-Received: by 2002:a05:6a00:1781:b0:50a:94f0:661d with SMTP id
 s1-20020a056a00178100b0050a94f0661dmr23930814pfg.10.1653320791891; 
 Mon, 23 May 2022 08:46:31 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170902e9d300b0015e8d4eb216sm5430916plk.96.2022.05.23.08.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 08:46:31 -0700 (PDT)
Message-ID: <520b25a5-1270-6ccd-cf88-281a077cecb2@linaro.org>
Date: Mon, 23 May 2022 08:46:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 23/49] semihosting: Split out semihost_sys_open
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-24-richard.henderson@linaro.org>
 <CAFEAcA8ENQo8258jw=CeBG6Qamk49_zQ9RQjuwd4ZfymD=cV-w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8ENQo8258jw=CeBG6Qamk49_zQ9RQjuwd4ZfymD=cV-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 5/23/22 06:30, Peter Maydell wrote:
> So this changes the errno values in the not-gdb case from being
> host errno values to the gdb protocol ones. Errnos in Arm semihosting
> are an unspecified mess, so maybe we can get away with changing
> the existing QEMU behaviour; but I'd rather we didn't do it
> one syscall at a time in a big refactoring series if we can avoid it.

Ok.

Also, I think I mentioned this in the v2 cover but not here, that having done the errno 
conversion here for arm semihosting, it worked less well for mips and xtensa, which have a 
rather better defined set of errnos.

My question from v2 was: should we in fact convert back from gdb's errno to host errno in 
gdbstub.c handle_file_io(), and then let each semihosting backend convert from host to guest?


r~



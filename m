Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9FC407319
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 23:51:27 +0200 (CEST)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOoQe-0000i4-Sj
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 17:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mOoOk-0007Xg-BV
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 17:49:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mOoOi-0003GJ-NJ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 17:49:26 -0400
Received: by mail-wr1-x429.google.com with SMTP id g16so4580518wrb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 14:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jcPMJJVxY4+Eif6lEptvHTPuP+CEIwBcZFAQTHVrXUU=;
 b=bvy+WWPN4KeqhUrJ8ulwS4PzlFnIUPZWfh1TrvwKyXzC5coa/1HuzwCvozTd9/c5tE
 QxDFZmsxtXQoIxTZFTYMA1xUQz3qT513XDjqv8zPALoGHlhlcTMwvU0CykWm0JtAsCH1
 h2LaDlrkFdRb+CwS1CD3HLM7e0BA6T6PbgD2NME2yf6bC6N50HmUzcCL1FEsHV+8jwnc
 rYrppjWPf2jtwnClzg94z5Jmm69LuxhNEbvse7PF3InuoNRErcIODrpjRAUaq/ahaxP5
 lwrR1YkmUZMgFRh/BKuEl4sBSZE0GFHuSjwVT0t1vYldz/9OUR16wOJ4BsoFn5fEigXo
 xfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jcPMJJVxY4+Eif6lEptvHTPuP+CEIwBcZFAQTHVrXUU=;
 b=eFDFqRucSu1dXI+6D7mfVLWuYPtCDF0F+7rc0wd9M94hu6CABeK51nqEO5DP5rgEpw
 EEhRKBr6WeeQo5tgAbJbkU4Ad44ZuHjbVV3yL+GwoZAI1CIW2M91L57nrS76Aa02vs7X
 FM4Itq7YNYfP4S7GW+eZ4R2JhJXKdV/vMU/MwbWiolEvhLqGKRRG0b27ulDgkI7cO43T
 J5th6kO1lsh06XM71hGesMVZRntOan4SEC+eCNgdpEJHJrD97A72Ev4fsvKRQlP7LPOC
 eH994zd5YOVF1GUKjuUtuijJpO/0oC57B/AeCB30S7nxjKhthn6sBqZPuHinZGLVrVLA
 wr2w==
X-Gm-Message-State: AOAM531RSVSE13V2SSXKaSD4mEzvRO3pYUvv58rMJpl130Yv852HqSmz
 9bCsCcLzAS6soPBRppHQWv6fT2zs1sU=
X-Google-Smtp-Source: ABdhPJznLN48gwihnr5kxaSuAzuuMYIbYh49/ae3EUpUZnz8C6glRU3eY+Oa8jvh3UdT3uTWpu1+5g==
X-Received: by 2002:a5d:5042:: with SMTP id h2mr11737348wrt.57.1631310561733; 
 Fri, 10 Sep 2021 14:49:21 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id g1sm5758403wmk.2.2021.09.10.14.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 14:49:21 -0700 (PDT)
Subject: Re: simple serial device emulation
To: Hinko Kocevar <hinkocevar@gmail.com>, qemu-devel@nongnu.org
References: <CACOP0z-muPwpLjimweiACOoSiAeULS_aP16+_9goOZv12gTxug@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fe2a2b9d-e7b6-cbf6-ea3a-49702e297562@amsat.org>
Date: Fri, 10 Sep 2021 23:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACOP0z-muPwpLjimweiACOoSiAeULS_aP16+_9goOZv12gTxug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 9/10/21 9:35 PM, Hinko Kocevar wrote:
> I have an emulated MMIO area holding couple of registers that deal with
> serial UART. Very simple access to the Tx and Rx registers from the
> userspace point of view involves polling for a bit in one register and
> then writing another; when there is room for another character. When the
> guest app does write to a MMIO Tx register, as expected, io_writex() is
> invoked and my handler is invoked. At the moment it does not do much.
> I'm thinking now that the character needs to be fed to the serial device
> instance or something.
> 
> Where should I look for suitable examples in the qemu code? I reckon
> that other machines exist that do the similar. I found lots of
> serial_mm_init() and sysbus_mmio_map() uses around serial port instances
> but I'm not sure how to couple my "serial ops" to the "bus" or SerialMM
> (if that is the way to go).

Your device is a "character device frontend". See the API in
include/chardev/char-fe.h. Frontends can be connected to various
backends. The simplest backend is the standard input/output
(named 'stdio').

To be useful your frontend have to implement some handlers:
IOEventHandler, IOCanReadHandler, IOReadHandler. The frontend
register these handlers by calling qemu_chr_fe_set_handlers()
(usually in the DeviceRealize() handler).

The backends will interact with your device via this API.

I recommend you to look at the hw/char/digic-uart.c model which is
quite simple, it returns the last char received, and only transmit
one char per I/O.

Then for a more complete (and up to date) model you can look at
hw/char/goldfish_tty.c, it uses a FIFO to receive chars, but still
transmit one char at a time.

Finally the hw/char/serial.c is probably the most complete models,
with 2 FIFOs (RX & TX) and try to respect timings.

Regards,

Phil.


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED1474481
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 15:07:12 +0100 (CET)
Received: from localhost ([::1]:60752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx8SU-0001sg-T1
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 09:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1mx8Bw-0000C0-0U
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:50:05 -0500
Received: from [2a00:1450:4864:20::534] (port=33737
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1mx8Br-0006ka-LR
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:50:00 -0500
Received: by mail-ed1-x534.google.com with SMTP id t5so63009422edd.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d5ndx34hN9m4TAr2xVMmBcuyEYVL6HUh2Zoc6H0l7hk=;
 b=kaRvdUhjK5mUvT3+oDIJClgAKiVvpfQFixukB5F2HVK4rUJMJ9XjxhXjCrceLjBc4h
 StwQCf3n4o/vQdj8KeHTHh5ZcUS/vDMwQtV9JtHE0BmKFUQquPKlB4gankOpGawqLTSi
 DiB9D4XD3hlmVj0KHHaeDaMClV/fnlmnLuz+2cAOjTXHljQ+alZaeT6ESVo2ll8lLHh6
 tTRydUk99j6UVvoeSBCytWV94rfGcVes/oR6rF/Tt6xDstaVqyV4/zAD0WxNznlcSVsp
 FBGOLRdd2dNFgUssQ82YMqtL4n60hzlBATcKzBhMqN9dPMdShuK8XQlm8K0MnUBT/omo
 PWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d5ndx34hN9m4TAr2xVMmBcuyEYVL6HUh2Zoc6H0l7hk=;
 b=qwr2Bp5FShk0IarLH6jqt6yXprMQUtUQJl8XSZcP2dx7S5g6oBJ0gvzJXUg91W1Abh
 AufO+KsQv7a2PbLhSUK2FG4kbpogOKjdxZ8wsEsfX/y48M+OrxboGL0ctznDnPMZ8A+8
 MfBnrommIL2H3WHZfnxRbDLF8C1e26gsiGrjLy+UycgljYBLD7QQSUulxVCDoBhjDquS
 1/SQfqzokcvd7CComzZh62OqKTq22SASP06YQyoBKtIkkHFbz0v/ginNMGDr5d5VOe/3
 kTsKZzL1EMVxXrn2eNxB+OzUJOur0jnJyjQK6pl/WMb2KVIQgjynaYva3pUP13OXfdnH
 XqSw==
X-Gm-Message-State: AOAM532nKsmnCN7nWqFvR8VQ1dhIWNilo7qmXK1BYlJjcv/9fCQI3bv0
 XmbdL+asOk3ZZSXroZ2gT5Y0d5jZaO4=
X-Google-Smtp-Source: ABdhPJySJ7nTJD03hzl2t9OmC0fdR31hCq/n5Ku3bel24kiVofteNrsCpe58LVNU6wohiG/7LHR/Qw==
X-Received: by 2002:adf:a10f:: with SMTP id o15mr5860296wro.592.1639489258334; 
 Tue, 14 Dec 2021 05:40:58 -0800 (PST)
Received: from [192.168.1.186] (host31-48-92-117.range31-48.btcentralplus.com.
 [31.48.92.117])
 by smtp.gmail.com with ESMTPSA id u2sm16264414wrs.17.2021.12.14.05.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:40:58 -0800 (PST)
Message-ID: <adfe1c14-f773-0592-e304-d80da8380cc0@gmail.com>
Date: Tue, 14 Dec 2021 05:40:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] xen-hvm: Allow disabling buffer_io_timer
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org
References: <20211210193434.75566-1-jandryuk@gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20211210193434.75566-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=xadimgnik@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: paul@xen.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2021 11:34, Jason Andryuk wrote:
> commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
> coded setting req.count = 1 during initial field setup before the main
> loop.  This missed a subtlety that an early exit from the loop when
> there are no ioreqs to process, would have req.count == 0 for the return
> value.  handle_buffered_io() would then remove state->buffered_io_timer.
> Instead handle_buffered_iopage() is basically always returning true and
> handle_buffered_io() always re-setting the timer.
> 
> Restore the disabling of the timer by introducing a new handled_ioreq
> boolean and use as the return value.  The named variable will more
> clearly show the intent of the code.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>


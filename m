Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B11474405
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:58:29 +0100 (CET)
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx8K4-0001JT-At
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:58:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1mx83M-0005Uf-Np
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:41:13 -0500
Received: from [2a00:1450:4864:20::42e] (port=36640
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1mx83K-0005BK-L3
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:41:12 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u17so32470664wrt.3
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:41:00 -0800 (PST)
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
 b=jbxARxhSFwWtqXHbyGiIdqvNGi9GB5SMWkt/nPs68iXzJCJr4h/bN5yL4tiW+QbPql
 Cyt9V1bdsFlHJeLR8/5zrWp0NS3MTwdDH+6c4zQnjN04emay5cZsbGfLuBORU/MnAk7Q
 7IytZgSWrs1nCbWylHajIj2M0jGPgcue/kBplwB5cMP4IMtGoEoMZlW064+qadSc6383
 hH3xZgoMZHpCkj7zKX0RFbq7ysCuufaZMdgjwRpfZQLBFk+npYfPvZawP6hELdtMAQhK
 sNlUQmvifiz+BKv0KDrDqFKA+ofD1Ilf605cF7YSLSNoTZltULi9EA2OI4N4NJaci/Ni
 JgLQ==
X-Gm-Message-State: AOAM532O7PBaIApAdooyFHnPtEBOMWXOUUQ+D5T0bWP0Va9svhynbTgv
 2XXmm3r/7luxh1YJUkXl6Pw=
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42e.google.com
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


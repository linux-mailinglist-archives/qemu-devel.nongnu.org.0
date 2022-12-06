Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06B864482C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 16:40:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2a1v-0004Dj-B0; Tue, 06 Dec 2022 10:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1p2a1t-0004DI-GJ
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:38:45 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1p2a1r-00032x-SG
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:38:45 -0500
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 708ED1FE64;
 Tue,  6 Dec 2022 15:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670341119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwECvW/p5DCl2sVgSYV7m7kCOMi0Z7sPmf5d7sMch9k=;
 b=1VeDq9HW9JJ4D4WUp29gfdHQndvA4VP707vtTcV/LvQYKkTa1tPfkAdRgZojJFyO9PdFgN
 F+1p/ftydYzNn9nAV8A0n5DWyDKJke2HMXtSqZnJQBA9lxUp2wOMjgnub/kZxrPwBbWd2b
 IYXsKx+pTH2ia/yjH0Jp3WNFn64QRio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670341119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwECvW/p5DCl2sVgSYV7m7kCOMi0Z7sPmf5d7sMch9k=;
 b=M0/Wi44OyODASNU4Ak0cfkBBD6CRKNpbiTF7lYnEIPg09U4jtVuk8Cgyu6I4UXL9Hh41a7
 B3feitVb0Vdd3GCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 903D313326;
 Tue,  6 Dec 2022 15:38:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id TfsJEf1hj2OzSwAAGKfGzw
 (envelope-from <cfontana@suse.de>); Tue, 06 Dec 2022 15:38:37 +0000
Message-ID: <34f8c636-6963-8974-39e7-497167c5119a@suse.de>
Date: Tue, 6 Dec 2022 16:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 02/11] exec: Restrict hwaddr.h to sysemu/
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
 <20210517111111.1068153-3-f4bug@amsat.org>
 <5d1a9740-df5c-fa6e-8c67-1dcd7174df66@suse.de>
In-Reply-To: <5d1a9740-df5c-fa6e-8c67-1dcd7174df66@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 12/6/22 15:53, Claudio Fontana wrote:
> On 5/17/21 13:11, Philippe Mathieu-Daudé wrote:
>> Guard declarations within hwaddr.h against inclusion
>> from user-mode emulation.
>>
>> To make it clearer this header is sysemu specific,
>> move it to the sysemu/ directory.
> 
> Hi Philippe,
> 
> do we need include/exec/sysemu/... .h
> 
> as opposed to just use the existing
> 
> include/sysemu/
> 
> ?

...and I would if anything go include/sysemu/exec/ not include/exec/sysemu ,

to highlight first that it is part of the sysemu build, when trying to reason about what gets built for sysemu vs anything else.

Ciao

C






Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4281C5AE2B0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:33:39 +0200 (CEST)
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVU1U-0000Jz-Fn
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVToV-0008WP-1y
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:20:07 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:48292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVToS-0002Vf-E1
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:20:05 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C1FBE33952;
 Tue,  6 Sep 2022 08:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662452401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48PtQlWaZEYYbB1/E/Fui2byeHXd0l4ij44lYbPiN34=;
 b=fSKNnUk6e/GjhR80kGffcbB7K3eyla1zIzVW+Ps5V7yWQ9YBWzU9gcNhFNRMMdVm1bdutr
 TsdeFxqRPYKebS0619sUZP90PE3S6y9//surFCfhbV+vB4bofIZI3oofsiJUJp0hgUAwbI
 gkAY4TYTnr9+/VPir7rLYKV71u2UJMs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662452401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48PtQlWaZEYYbB1/E/Fui2byeHXd0l4ij44lYbPiN34=;
 b=c3SWGvKjRMWfaKLQETbVtdR3AAkA9aPsjFPS0PeJFVRKALYkLFmm99/A+syGf2n2wha2Sn
 2OddzoV6TLu/5IDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BE5313A7A;
 Tue,  6 Sep 2022 08:20:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b1IWGLECF2PMTAAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 06 Sep 2022 08:20:01 +0000
Message-ID: <477f6527-4e0b-83c5-13a5-d0ea1f67806e@suse.de>
Date: Tue, 6 Sep 2022 10:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC] module: removed unused function argument "mayfail"
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220905155532.1824-1-cfontana@suse.de>
 <f7a9293e-1158-d5ae-a6f5-31c4a4ef6fed@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <f7a9293e-1158-d5ae-a6f5-31c4a4ef6fed@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/5/22 22:55, Philippe Mathieu-Daudé wrote:
> On 5/9/22 17:55, Claudio Fontana wrote:
>> mayfail is always passed as false for every invocation throughout the program.
>> It controls whether to printf or not to printf an error on
>> g_module_open failure.
>>
>> Remove this unused argument.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>   include/qemu/module.h |  8 ++++----
>>   softmmu/qtest.c       |  2 +-
>>   util/module.c         | 20 +++++++++-----------
>>   3 files changed, 14 insertions(+), 16 deletions(-)
> 
> Why RFC?

Maybe there was some obscure way the parameter was intended to be used by someone, somewhere :-)

> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Ciao,

C


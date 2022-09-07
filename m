Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109AC5B00F0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:54:41 +0200 (CEST)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrlY-0005uq-9g
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVrPX-000510-UK
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 05:31:56 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:41016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVrPW-0001KC-AU
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 05:31:55 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B92A933C00;
 Wed,  7 Sep 2022 09:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662543112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofKWCprpaqX3rE7gAqSH1AI6R6xnhMi8aoVjM4UaZVM=;
 b=Prc3Xus25L/fnTWPd8S12jMBnUkj1uqAHKQ4Jq/zBPA1Oaxn62ePapj8i7YRjNvAUlJceg
 2+PumkceDTVlCNvC2Xq4kRprNVZAW+23+Ldz3mT0Z7uTptqOcl1gqrsKHJiV+jyrO/XiQ/
 P8iOJjpT5S+jCAm860AEx5D8pbcY6z8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662543112;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofKWCprpaqX3rE7gAqSH1AI6R6xnhMi8aoVjM4UaZVM=;
 b=+Blud7aE9a3ZHKmpJZmARtOod+DvG4/xbul1L5ANg+YoNAPFUGHWGSxkmVcuMDQADGdt+K
 sOQ2eRsvDX7kkICA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62F1E13486;
 Wed,  7 Sep 2022 09:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Q38RFghlGGNhMQAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 07 Sep 2022 09:31:52 +0000
Message-ID: <762f48d2-9c28-c34f-a51b-710e34ddca95@suse.de>
Date: Wed, 7 Sep 2022 11:31:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 dinechin@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20220906115501.28581-1-cfontana@suse.de>
 <20220906115501.28581-3-cfontana@suse.de>
 <6608303b-0e08-8045-3872-257450e1adb5@suse.de>
 <20220907073657.d4c27abnctjlxviw@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20220907073657.d4c27abnctjlxviw@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.752,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/7/22 09:36, Gerd Hoffmann wrote:
>   Hi,
>  
>> For this module_load_qom_all() maybe Gerd has a bit more context on
>> was should be the error reporting here?
> 
> Use case for module_load_qom_all() is someone enumerating the qom
> objects available.  So we load all modules known to have all object
> types registered and can return a complete list.
> 
> It could be that some of the known modules are not there.  Consider a
> distro packaging modules which depend on shared libraries into optional
> sub-rpms, to reduce the dependency chain of core qemu.  So, with core
> qemu installed and (some of) the sub-rpms not installed
> module_load_qom_all() will obviously fail to load some modules.
> 
> But I don't think those errors should be reported.  The object types
> implemented by the missing modules will also be missing from the object
> type list ...
> 
> Example: hw-usb-host.so is not installed.
> 
>   => 'qemu -device help' should IMHO not report the module load error
>      and just not list the 'usb-host' device.
>   => 'qemu -device usb-host' should report the module load error.
> 
> take care,
>   Gerd
> 

Hi Gerd,

the thing is, we can distinguish between a module not being present (ENOENT, ENOTDIR),
from a module being present, but failing to load.

So the "module not there" thing does not need to be treated separately, because no warning/error will be emitted if the module is not there.

It is up to the user/caller to decide what to do with the condition "module not there", error out and quit, continue on, etc.

Thanks this helped,

Claudio


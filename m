Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543BA3AADF7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 09:49:28 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltmmE-0003p9-Sq
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 03:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ltmkz-00039D-P3
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 03:48:09 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:43252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ltmkx-0002uu-Vm
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 03:48:09 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E2C821A8D;
 Thu, 17 Jun 2021 07:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623916086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+YVmug4syP3xTHyc0sLMa9UDTcltYTTEIKZr1mQTnZg=;
 b=hgclR3MyyOlgLRPopgNb0Heiv247IJ09Ju5w1E3PHzHId4ZecWvn4wGz9B2dJoUH7NmTst
 0w6jv7mvuuV0YNJ8rgU4I2Ur1Aq9S8hC+iKWy7FqNcI5H24zgZEksfp9zpVJvUaa7hSGci
 xXtC6UUr1nkXsO3a4bfK/0DP4TOlOFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623916086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+YVmug4syP3xTHyc0sLMa9UDTcltYTTEIKZr1mQTnZg=;
 b=1uedUIODcP+SiP7jn9NGBD9GNMZRfHiZcj8H0yvDuBpiN4eDlSrpjeDBdXv/sOid+48XsV
 32vEQgeH0SBn/5Dg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CEC1D118DD;
 Thu, 17 Jun 2021 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623916086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+YVmug4syP3xTHyc0sLMa9UDTcltYTTEIKZr1mQTnZg=;
 b=hgclR3MyyOlgLRPopgNb0Heiv247IJ09Ju5w1E3PHzHId4ZecWvn4wGz9B2dJoUH7NmTst
 0w6jv7mvuuV0YNJ8rgU4I2Ur1Aq9S8hC+iKWy7FqNcI5H24zgZEksfp9zpVJvUaa7hSGci
 xXtC6UUr1nkXsO3a4bfK/0DP4TOlOFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623916086;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+YVmug4syP3xTHyc0sLMa9UDTcltYTTEIKZr1mQTnZg=;
 b=1uedUIODcP+SiP7jn9NGBD9GNMZRfHiZcj8H0yvDuBpiN4eDlSrpjeDBdXv/sOid+48XsV
 32vEQgeH0SBn/5Dg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id NvzWMDX+ymAlEQAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 17 Jun 2021 07:48:05 +0000
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <5953598.eXybCX72BP@pizza>
 <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>
 <2963309.4TrVdrBa0x@pizza>
 <20210616092815.rjznyjnvgrrfojq6@sirius.home.kraxel.org>
 <bdf9b356-87ee-0749-c977-f48989fa8e26@suse.de>
 <20210617053759.uibvdpu2wtq3fqwv@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2be72be7-5c3f-e25d-fb84-cf58b573bf27@suse.de>
Date: Thu, 17 Jun 2021 09:48:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210617053759.uibvdpu2wtq3fqwv@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?= <jose.ziviani@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 7:37 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>>>> However, please correct me if I'm wrong, I understand that an accelerator as a 
>>>> module will add an overhead that some user won't be willing to pay. So, give 
>>>> them the option to have built-in accelerators seems a good idea.
>>>
>>> Modules add some overhead, yes, and there are surely use-cases where you
>>
>> Where do we expect the overhead to be, and of which nature?
> 
> The dynamic linking needed then when loading the module adds a bit of
> overhead (compared to static linked code).  Increases qemu start time
> a bit.
> 
> On the other hand the start overhead can be reduced by modules,
> specifically for the case that a module depends on shared libraries and
> is *not* needed.  With for example gtk being modular the gtk shared
> libraries (plus indirect dependencies like pango, cairo etc) are only
> loaded when you actually use gtk, whereas a non-modular build would load
> them no matter what.

Interesting observation.

> 
> The code reorganization needed for modularization can add some overhead
> too, when using function pointers instead of direct calls for example
> (see QemuSpiceOps).  That overhead doesn't go away when you do a
> non-modular build though ...
> 
> take care,
>   Gerd
> 

Do we need to be able to unload modules that we previously loaded? Or is this not a realistic requirement?

Thanks,

Claudio


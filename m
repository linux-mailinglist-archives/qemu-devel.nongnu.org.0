Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3080D3A42ED
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 15:18:41 +0200 (CEST)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrh3Y-0005iL-9F
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 09:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lrh2Q-0004sU-9R
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:17:30 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:52300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lrh2O-0004cU-6Y
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:17:29 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 423FD21A5C;
 Fri, 11 Jun 2021 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623417445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXYlsqy+JXQ5ifakcMnPDYN6FJbBpE/h4v7Pg8YWICw=;
 b=cjxnhdnxZQVEwYwU4Lcb1Q/QJluNBtR9y/Ig8WctdU4HLc2VflUdMhQEiAEZ3aJjYhrsTM
 BaA8WCWBV/5MvrwNZSKhq4SbtEb4mYz76QSzTa5IVeXHogG9mpZjzXqlepXUyQ/q+c232o
 HiWtz6qimzuVnQzwy1i0Fy8di5PlGI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623417445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXYlsqy+JXQ5ifakcMnPDYN6FJbBpE/h4v7Pg8YWICw=;
 b=ZQovRkCDGzSbpy0qJXlV74F6kvSibVahRQEmDk3EXHT3Wc7L09ajby0sCYZK/8fJmlNTwT
 xXPKNx49wPC4plAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0278F118DD;
 Fri, 11 Jun 2021 13:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623417445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXYlsqy+JXQ5ifakcMnPDYN6FJbBpE/h4v7Pg8YWICw=;
 b=cjxnhdnxZQVEwYwU4Lcb1Q/QJluNBtR9y/Ig8WctdU4HLc2VflUdMhQEiAEZ3aJjYhrsTM
 BaA8WCWBV/5MvrwNZSKhq4SbtEb4mYz76QSzTa5IVeXHogG9mpZjzXqlepXUyQ/q+c232o
 HiWtz6qimzuVnQzwy1i0Fy8di5PlGI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623417445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXYlsqy+JXQ5ifakcMnPDYN6FJbBpE/h4v7Pg8YWICw=;
 b=ZQovRkCDGzSbpy0qJXlV74F6kvSibVahRQEmDk3EXHT3Wc7L09ajby0sCYZK/8fJmlNTwT
 xXPKNx49wPC4plAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id r/jNOmRiw2ACVQAALh3uQQ
 (envelope-from <cfontana@suse.de>); Fri, 11 Jun 2021 13:17:24 +0000
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
To: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <4a1a23af-461f-92c4-d9f0-1f8133d611db@suse.de>
 <20210610122305.zxdaqsft5evcrli6@sirius.home.kraxel.org>
 <b2fb96b8-415b-b2d4-168c-d43dc20ef7b6@suse.de>
 <4dffdaf1-e7e5-cb28-7f7a-2061f182ee5b@redhat.com>
 <20210611082925.7wkppsrj7hywquns@sirius.home.kraxel.org>
 <20210611130321.rp4gnnja7z22p6zl@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b1f3a29a-3573-255e-16bf-9c6a8b36f5d0@suse.de>
Date: Fri, 11 Jun 2021 15:17:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210611130321.rp4gnnja7z22p6zl@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 qemu-devel@nongnu.org, jose.ziviani@suse.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/11/21 3:03 PM, Gerd Hoffmann wrote:
>   Hi,
> 
>> Are there any pending patches to handle the remaining tcg dependencies
>> in qemu?  When trying to build tcg modular (more than only
>> tcg-accel-ops*) I get lots of unresolved symbols to tcg bits which are
>> referenced directly (in cpu.c, gdbstub.c, monitor, ...).
>>
>> The CONFIG_TCG=n case is handled either with stubs or with #ifdef
>> CONFIG_TCG, which doesn't fly for modular tcg ...


We need CONFIG_TCG=m right?

Which means quite a few changes.

> 
> So, enough for today, to be continued next week.
> Work branch pushed to
>     https://git.kraxel.org/cgit/qemu/log/?h=sirius/modinfo-playground
> 
> Topmost patch doesn't compile but shows the build changes.
> 
> take care,
>   Gerd
> 



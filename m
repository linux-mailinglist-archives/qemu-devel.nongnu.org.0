Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DEB62F14C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxlc-00015V-OP; Fri, 18 Nov 2022 04:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ovxla-00015J-N9
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:34:34 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ovxlZ-0008PL-6x
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:34:34 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 252A11F45E;
 Fri, 18 Nov 2022 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668764070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKF8rRnko22MD3U8LNMen/nX9LQzQPDAsWb3khJ/a7M=;
 b=QQ/K8zlmdAEYlzZ8j3sm/ciUJLggX3lw7TbF5/p23it0zvQdUClNj5RAm2T0HRoNp8UUUC
 26eHstKSBKdLKsrLEcm73MHAwQqRVk9DCnQSfGQ2N1hxwgeaP8x2MAQN4SqQMG/fZwxpEj
 72kOXFPpJkofRcThZusUwAS/w+PEeco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668764070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKF8rRnko22MD3U8LNMen/nX9LQzQPDAsWb3khJ/a7M=;
 b=Pcsp1IiQDU2e7AbWapOzV3eI8kvMGXeLUMajVY8cNXe7QCcmeEGXSqINDeghon11djT+Vc
 wnk0d0aSBY4we8BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD7BD1345B;
 Fri, 18 Nov 2022 09:34:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LU0VLKVRd2P8GgAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 18 Nov 2022 09:34:29 +0000
Message-ID: <14e54889-302f-b0b7-b68e-404c85b58f35@suse.de>
Date: Fri, 18 Nov 2022 10:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 1024
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "mst@redhat.com" <mst@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>
References: <166869883160.17656.1212026522016331235.stgit@tumbleweed.Wayrath>
 <bbbf1267cc26132e3d8627b7e2603c98cbe343c1.camel@suse.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <bbbf1267cc26132e3d8627b7e2603c98cbe343c1.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/17/22 19:04, Dario Faggioli wrote:
> Well...
> 
> On Thu, 2022-11-17 at 16:27 +0100, Dario Faggioli wrote:
>> Keep the old limit of 288 for machine versions 7.2 and earlier.
>>
> ...At least, this was the idea...
> 
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -386,6 +386,7 @@ static void
>> pc_q35_7_1_machine_options(MachineClass *m)
>>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>      pc_q35_7_2_machine_options(m);
>>      m->alias = NULL;
>> +    m->max_cpus = 288;
>>
> ...But I managed to put this in the wrong function (xxx_7_1_yyy,
> instead than xxx_7_2_yyyy)! :-/

I was just about to comment on it :-)

> 
> Sorry about taht. I'll send a v2 (taking the feedback that I got to my
> other email into account).
> 
> Regards

Ciao,

C


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6C5B1FB2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:54:30 +0200 (CEST)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHzB-000713-PQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWHsn-0006iS-VP
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:47:53 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:42328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWHsl-0006FJ-5z
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:47:52 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1620A22711;
 Thu,  8 Sep 2022 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662644867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lgvirrSQlFxD5n9bp1aul3uvOk2aF5P54IajmdFDTs=;
 b=kqLd77F3kaciWXsPiLU5qIf9KHOb6eL60khKwJiiC1oeP4tkiRiq2pd+1cVyifCEQ4IQPw
 Dlcz4JlJ9ZfLD+FRJs4d+8DJ3VRwehjqp9tQx4o3+yCBNblywWeoWFCdh7NtnN+uy/ZSmq
 jXak3nGwKzQzedJjK5+1kdu1DEaP1EU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662644867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8lgvirrSQlFxD5n9bp1aul3uvOk2aF5P54IajmdFDTs=;
 b=1UaQAq7BhV7ijRpasKV29yaRTdePPYNvPWdG104pgoGtISgntGnb6p66fZmgyKFMMXAzPj
 aCiQumn6Gf2nFlAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B960B13A6D;
 Thu,  8 Sep 2022 13:47:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KIOmK4LyGWMRRgAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 08 Sep 2022 13:47:46 +0000
Message-ID: <67f82e6b-683d-564f-aa9f-a9aaaafd0382@suse.de>
Date: Thu, 8 Sep 2022 15:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3] audio: add help option for -audio and -audiodev
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, =?UTF-8?Q?Volker_R=c3=bcmelin?=
 <vr_qemu@t-online.de>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220908093936.19280-1-pbonzini@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20220908093936.19280-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
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

On 9/8/22 11:39, Paolo Bonzini wrote:
> Queued, thanks.
> 
> Paolo
> 
> 

Thanks. When it comes to programmatic checks about what QEMU supports in terms of audio,

is there something that can be done with QMP?

I checked the QMP manual at:

https://qemu.readthedocs.io/en/latest/interop/qemu-qmp-ref.html#qapidoc-2948

but in the "Audio" section there is a bunch of Objects and enums defined, but no command to query them...

Thanks,

Claudio


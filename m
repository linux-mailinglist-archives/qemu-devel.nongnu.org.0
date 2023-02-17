Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEF569A939
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 11:46:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSyFD-0003mx-Az; Fri, 17 Feb 2023 05:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pSyF4-0003mS-JX
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:45:33 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pSyF3-00019f-0g
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:45:26 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 87CBE1FE57;
 Fri, 17 Feb 2023 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676630721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icGPsAR79wCA29Xt46NXPY6n6gEE9rUunbNU1aBmVMY=;
 b=LGjAgXDRDx/dkOElOz2M8N3At/cc8Haztwk1mAnnDlp3DVr6FlzjSqBe5+Flr+HBKIDC25
 05Iijg1coz/rpA07ZS2Rbujm+aXNobgUGoJxaPHGjh8nTHO8IJDh1fXqz76K9Ppik1pKs1
 ydtbNuXuR/kVahnrlfVxmG7wg7KKQjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676630721;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icGPsAR79wCA29Xt46NXPY6n6gEE9rUunbNU1aBmVMY=;
 b=AiQ/LaDGqhYGEHEQoLQnkE2Q7DCuzIwkG1wZuP8hAwoQb3qWJ7pozM7xGKZCiIEa7VkJE5
 Xnch1nreRz/0wrDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2186C138E3;
 Fri, 17 Feb 2023 10:45:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ag+lBsFa72NdNgAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 17 Feb 2023 10:45:21 +0000
Message-ID: <b816a3a5-c101-050e-9e14-4af0cc99984e@suse.de>
Date: Fri, 17 Feb 2023 11:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <87a61cbmti.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 2/17/23 11:36, Markus Armbruster wrote:
> I feel the discussion petered out without a conclusion.
> 
> I don't think letting the status quo win by inertia is a good outcome
> here.
> 
> Which 32-bit hosts are still useful, and why?

Hi Markus,
 
if the question is very very general, my opinion is that some of the most useful 32-bit systems are things like ARMv8-R capable systems for deeply embedded real time applications.

Ciao,

Claudio




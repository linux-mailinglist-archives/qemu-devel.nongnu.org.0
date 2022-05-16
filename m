Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD3352810D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 11:51:42 +0200 (CEST)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqXO9-0006XZ-E7
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 05:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqXL1-0005kn-0p
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:48:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqXKz-0005pH-2q
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652694502;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=9yyK63bE8UUfmi0idqaI1cyB5A5o2KAaM3zb1+pGdNI=;
 b=DCsJbcKsSK60FRcNxPPDpQBrDR8qnUGhuJ4IWO59uRM2giDJ5mOsAxtm987DjFWXDStvPD
 rlLoI0/jIt09G3XP0LyZCNFgE7f0JxXtSsj8zwGMYpPIwJ+xZ6/36EDO86riyAp75Bkf7p
 y7wBHO3i0GH4IVIKIU2yhLRw2FSzk+s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-20AndjnqNyqzX3Sevkrb2Q-1; Mon, 16 May 2022 05:48:21 -0400
X-MC-Unique: 20AndjnqNyqzX3Sevkrb2Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 z23-20020a05600c221700b003942fd37764so10078376wml.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 02:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:user-agent:reply-to:date
 :message-id:mime-version;
 bh=9yyK63bE8UUfmi0idqaI1cyB5A5o2KAaM3zb1+pGdNI=;
 b=aBp40msAhQ521CFEr2T+R0HlsqNOD/3Q2opcuh8fGv8U05Gjseq0iNlmsVdxHFKx5j
 yFpJ3BQ+RID28NzYQySGWNYixDF4x69PHAHqanXNS0flz/luJOsV9rU3i4WPH5kSV1B0
 QMX/M7myye1hqxPc1n5oCDq5Vg3a38xjndce7cH9OBGN40xda8un8RUM0gDzMCb1E0nG
 1hIc6l6pXl+LQZ0YrNr7BJYElmHh6u4/uPxPw2Lt8JXz/JybTCyTxDXWdjffA1kQ+foI
 5uGWXkobRYeaxIT0HITStjs555Z2iU13pEta4Hx+FM8Q1Cx8JK384xFMc++GMraPpN55
 Mhbw==
X-Gm-Message-State: AOAM533+cBA6nKSR42AAzA/zIpkSeDrGNxb+gl++SUX8Gk0nltHKg9mq
 tv6z0xVdYixvw5bpSRtF7wc+R5k8nH1a2Y9o4XunP+DJ8vPp6nuoRUdNuA2p1vTTcjjt/JeT73U
 ChqAIrnUM4i+DghvOzgNOuPqTTk4S2ioy8WuFuVyb4LsF0QDWkDNEpKyjFBRG1wKMSkQ=
X-Received: by 2002:adf:ed4e:0:b0:20a:c805:1d62 with SMTP id
 u14-20020adfed4e000000b0020ac8051d62mr13569417wro.134.1652694499941; 
 Mon, 16 May 2022 02:48:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymaqWr/G7KrL4LFQxY9QTJQsqvU8CCyfA43+hENKCPT1TaV8DUnCZZX7Bg1PQHr4cTbZf81w==
X-Received: by 2002:adf:ed4e:0:b0:20a:c805:1d62 with SMTP id
 u14-20020adfed4e000000b0020ac8051d62mr13569388wro.134.1652694499557; 
 Mon, 16 May 2022 02:48:19 -0700 (PDT)
Received: from localhost (static-211-115-85-188.ipcom.comunitel.net.
 [188.85.115.211]) by smtp.gmail.com with ESMTPSA id
 n6-20020a1c2706000000b003942a244ec0sm11677612wmn.5.2022.05.16.02.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 02:48:19 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org, kvm-devel <kvm@vger.kernel.org>
Subject: KVM call for 2022-05-17th
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 16 May 2022 11:48:18 +0200
Message-ID: <878rr1u7tp.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Hi

I know it is a bit late for the call for topics, but it appears that
there are people who wants to discuss live migration improvements.  If
we got an agenda, can we have a call tomorrow?

Please, send any topic that you are interested in covering.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

After discussions on the QEMU Summit, we are going to have always open a
KVM call where you can add topics.

 Call details:

By popular demand, a google calendar public entry with it

  https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.



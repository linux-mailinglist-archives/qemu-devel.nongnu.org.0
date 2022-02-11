Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D43D4B2DE5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 20:41:45 +0100 (CET)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIbnc-000342-8M
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 14:41:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nIbkc-0002Lk-QN
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 14:38:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nIbkZ-00057E-Bv
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 14:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644608313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n/oeRASI9IPw5n3Y0y5AxYzsBrP/xkE+Y3g1kO5ub5k=;
 b=VwANkvEJ3vGrrq1ps7soFXDdWRvBkq3IquQKkI936o8FJwS09tMPk9Hk9mZvfPy0aojM1U
 AEfw513cdlYkbs2i1L5jtqKGs74ARdV6hyBEIvacKdiDZ9iMwSP/RCwrFCZZCj1DvOO5CG
 onGVJudp3wrVcZSNrUFq1nIO9toweMY=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-fJ4O9WxVO-aae05l5gl59w-1; Fri, 11 Feb 2022 14:38:32 -0500
X-MC-Unique: fJ4O9WxVO-aae05l5gl59w-1
Received: by mail-ua1-f72.google.com with SMTP id
 z38-20020ab04929000000b0030ef21ee1eeso4777989uac.17
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 11:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/oeRASI9IPw5n3Y0y5AxYzsBrP/xkE+Y3g1kO5ub5k=;
 b=fnD31zHjEJQdUQCb8aWwR1OwKXzI056e2qcQHRwS1osgyr4/LDLYSjfGIJaUUVDEYc
 Q/6OI0/C5ActPIazFxfePIAWOnyhTIR/2gA0tFWkpObuGL4BR2SsdoFH3NqA8guIPYn/
 J0rzwbNLQhwBE+7HWWUJm9nY9NAlZGz609UFYBBg70FKqmTKfnDPTb7CGszrvMkil9vW
 KnadE9QqBqgA03yMAk7+k8Au3psxCFktEU5YWIjl+4/oLxVvQ/4GlExO8G9AJhSvSqPs
 M6G18PuTI7SYtTqsPdpt2FZsmiYcqoLjoz09aEnc4lQ4mtFh44vnQpT3ti9mkOHIHlL3
 nleg==
X-Gm-Message-State: AOAM532znuOtQStoLAb+ktqtxrMBU5VJUBRQEcUNCDdbbiKjewN+txil
 RR7t2KZRznMGN+ZOyuYsG1sW5BJJwzoXiXAV+YdkSuyKYch4eZMcbkuSKrk+gDRRFgm63uF3aBQ
 ofsSsujAhu8DFVxAaCA8m8fP3JDKGoU8=
X-Received: by 2002:a1f:ee83:: with SMTP id m125mr1031753vkh.26.1644608311708; 
 Fri, 11 Feb 2022 11:38:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpAyo0psGnQAU3MNzsB5/XXwaMQHE1Snh/pRDWaQa2ksnPCPuOrsLybTuc1/JUPQORwlOqHzYWAixO5nyshm4=
X-Received: by 2002:a1f:ee83:: with SMTP id m125mr1031745vkh.26.1644608311461; 
 Fri, 11 Feb 2022 11:38:31 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-anWO3dpvcECpW6J1ExJLw01DhXvTYtC5FUi5p7kQ2tig@mail.gmail.com>
 <87pmnwqzq7.fsf@pond.sub.org>
 <CAFn=p-YVdQDbzUsQm97=FyuZN_m3jCsFzjTpguRPjtH3PezTMg@mail.gmail.com>
 <87zgmze0im.fsf@pond.sub.org>
In-Reply-To: <87zgmze0im.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 11 Feb 2022 14:38:20 -0500
Message-ID: <CAFn=p-b-gfeDgFfivtJ6tOixyydRb1kS8rS+H41RjiVZ-3Sgsw@mail.gmail.com>
Subject: Adding a handshake to qemu-guest-agent
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Moving our discussion upstream, because it stopped being brief and simple.]

What about something like this:

Add a new "request-negotiation" command to qemu-guest-agent 7.0.0.

[Modern client to unknown server]
1. A modern client connects to a server of unknown version, and
without waiting, issues the "request-negotiation" command.
2. An old server will reply with CommandNotFound. We are done negotiating.
3. A modern server will reply with the greeting in the traditional
format, but as a reply object (to preserve "execute" semantics.)
4. The modern client will now issue qmp-capabilities as normal.
5. The server replies with success or failure as normal.
6. Connection is fully established.

[Old client to unknown server]
1. An old client connects to an unknown version server.
2. A command is issued some time later.
  2a. The server is old, the command worked as anticipated.
  2b. The server is new, the command fails with CommandNotFound and
urges the use of 'request-negotiation'.

Compatibility matrix summary:
Old client on old server: Works just fine, as always.
Old client on new server: Will fail; the new server requires the
negotiation step to be performed. This is a tractable problem.
POSSIBLY we need to send some kind of "warning event" for two versions
before making it genuinely mandatory. Also tractable.
New client on old server: Works, albeit with a single failed execute
command now in the log file.
New client on new server: Works, though handshaking is now permanently
a little chattier than with any other QMP server.

***The QMP spec will need to be updated*** to state: the asynchronous
greeting is mandatory on all QMP implementations, EXCEPT for the
qemu-guest-agent, which for historical reasons, uses an alternate
handshaking process, ...

Compatibility concerns:
- We must never remove the 'request-negotiation' command from QGA,
forever-and-ever, unless we also make a new error class for
"NegotiationRequired" that's distinct from "CommandNotFound", but
that's more divergence. Supporting the negotiation request command
forever-and-ever is probably fine.
- QGA is now officially on a different flavor of QMP protocol. You
still need to know in advance if you are connecting to QGA or anything
else. That's still a little sad, but maybe that's just simply an
impossible goal.

Bonus:
- If an execution ID is used when sending "request-negotiation", we
know that the server is at least version 4.0.0 if it responds to us
using that ID. A modern client can then easily distinguish between
pre-4.0, post-4.0 and post-7.0 servers. It's a useful probe.

--js



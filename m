Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB43F5376
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 00:42:55 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIIec-0000oa-4n
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 18:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mIId3-0007Hz-EH
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:41:17 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:40889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mIId1-0000kn-R8
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:41:17 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso19994524otu.7
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 15:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=j88P7vRNveiBg+IfWADmD7kENKX67H/ZOenXrYX8QCk=;
 b=SD/k/PZAd0RXRhMC71l54VkVoxGQOsLKXYiDzkN7eO89T2cxfpGBIbPDAcbRFqQ8ie
 jBOLX3WivU8pu9x4qPG/CajHq8/0LBpvH18KbOaxEVWwaXFAegOyu2jMQwNunH7rigPm
 dDIMiRHhvdIy4gKaVAO2dqCyOV2zGa5zUSVi9dTa9gM1aWIIat0URZCyvPRiNjj4p+TN
 Fx8ortLR7qIibY70CIpqcR9ODOfwoH5/IJP/mJTHuU0fGfnzxdtATN3dTI6RLeDsWvvD
 Y7AzwNa9jiyTqnrDkYPzJ5Yth1UubbcAe7qIvVthsHn82jlb7W3WrESvRMSdLVS5PdND
 S5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=j88P7vRNveiBg+IfWADmD7kENKX67H/ZOenXrYX8QCk=;
 b=Tnn3PaImKbBF1gki29anq3ZXJMci7pOEPt3M+pcgiL+NYOApi8/4JfhzFA8EwbO7IQ
 atCV6Vi/xfHuHJHhnekaMm6SJcs51Eo3vkmY+5ZvX1umvQKVQ4loaK8qC085Ug0+lnhu
 ppLIGd4kvVDzLiMydgQoAuko56uvmskFekRC4kq550fEpPPeEFGk4fZThpdLPsntH6Ta
 x7QY3JVamur3L8/oNJeVxXf6eh9kGOaldQ3Yr78+5J++FJqCCSz8glysVye2Fz0rLO/2
 n83QSRIFLaQMk2bQiy9mRToLPr6V18xinKEDD5c0vfyTCBncdN56p+2ZtDNcqyIp7OR7
 GnFA==
X-Gm-Message-State: AOAM530n3k63Tdw6oIMpAxWrpVWW0id+5g7r9JeTct1TF19vaaqBbb+j
 ODY6J7csPXDao96xL8ARafJ2VCM/JI8=
X-Google-Smtp-Source: ABdhPJyCPHOtiaeGiAYoP4hhz7jg3e9xWR8dp5f/J4HyIclApvB8kWtJcVEljeuSafd/rcclKrXHaw==
X-Received: by 2002:a17:90b:1d88:: with SMTP id
 pf8mr742080pjb.152.1629756477203; 
 Mon, 23 Aug 2021 15:07:57 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.180])
 by smtp.gmail.com with ESMTPSA id j21sm16217454pfj.66.2021.08.23.15.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 15:07:56 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/5] python/aqmp: AQMP TUI
Date: Tue, 24 Aug 2021 03:37:41 +0530
Message-Id: <20210823220746.28295-1-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=niteesh.gs@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gitlab: https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v6
Based-on: <20210803182941.504537-1-jsnow@redhat.com> [v3,00/25] python:
introduce Asynchronous QMP package
CI: https://gitlab.com/niteesh.gs/qemu/-/pipelines/358117062

Updates since v5:

1) Moved all docstrings under init to class
2) Reworked the format_json function
3) Renamed the has_tui_handler function to has_handler_type
4) Added OSError to be considered for retrying
5) Reworked the editor to add messages to the end of the history stack.

G S Niteesh Babu (5):
  python: Add dependencies for AQMP TUI
  python/aqmp-tui: Add AQMP TUI
  python: Add entry point for aqmp-tui
  python: add optional pygments dependency
  python/aqmp-tui: Add syntax highlighting

 python/Pipfile.lock          |  20 ++
 python/qemu/aqmp/aqmp_tui.py | 652 +++++++++++++++++++++++++++++++++++
 python/setup.cfg             |  27 +-
 3 files changed, 698 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

-- 
2.17.1



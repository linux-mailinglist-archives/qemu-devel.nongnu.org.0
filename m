Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045743558D3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 18:07:52 +0200 (CEST)
Received: from localhost ([::1]:42630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lToF4-0000Zz-Rx
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 12:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lToCA-0006za-J4
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:04:50 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:33460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lToC7-0000SF-RM
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:04:50 -0400
Received: by mail-qk1-x731.google.com with SMTP id o5so15559537qkb.0
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=55z7uGsnhj+scpo17QEcqppSF6bd8v/9DXb0K+O4pJE=;
 b=DM7hcRgabRfJP90nKkvgnUQL0/OoDoX5io1IfXH+AtpiqKl99YFjlyRQxmFlWsL6du
 lsIiIyQYQMGsmAr5xI3sXc3PQOnYmLj9jRxmU34fKILqa69SjNB1l6mivRP7/Tq9YRPg
 lcwGVLEgHBKr+dVdNu25RcgDmJx4fGPQNYMXMdenzCt4d/EZRq9JiqkWZZXN6Fg7xn/f
 3Xtz+YHd2iQK4F/4m7tNoUYQ1VoyLRa/NiIZ28aLAfiEI9l8WAP8T5+OB1qm0UjYe/hn
 M9Ai65ykKHDaZb4GYgrIhhyt/uy/lRBDY8XTaz7lCAnQiyeXO5pHHRJr4Bhzm+EsZZuY
 jjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=55z7uGsnhj+scpo17QEcqppSF6bd8v/9DXb0K+O4pJE=;
 b=jJah+RTFTZrLpWj1AqwRvHDpNrqNkRbSKemd7F1c0RMk4iPnpeSFFyIZLABtyn0t+S
 ShylFMDPwJKh0gjNA5nNuL0yYDhT8n+zXXXUP26YD32GxtiEMo7awd/4CEdx+imqxjD6
 0AsibU0lo/z+jUp8T1UNyhskv0xDJTiN00wWvTXyOygvH+lIpeCcleXOBIc5TRE5Jx4C
 Hq1aueRL0joeh7MSabT9Oq6O9Z00uovfENmIXdQUz/ABo71EHck8iVmyV2N4cHEG0wiL
 YJIwWRZanpRs3cYZ97OqJBUf5rgv7BpLp/rWZg72Hx0MVZerjIW99QMxwiS18V/fHnxN
 Kj/g==
X-Gm-Message-State: AOAM533T9OKTklfLzES/M4eprm3KlpSIA7jD7Pqub/iRT4H7DD+/FuEC
 PL5Af0W2IcmLYAVp42PWUG1nnvbU5XZLwEHnZqK3ZoIOcyQ=
X-Google-Smtp-Source: ABdhPJzJsAF+woqxnh11xWqOoAuCtkhXB6D+OkTNNXEous5en0YlcLcRfXXWDjhVDqFcPHF9EyNPkBgLcduUEmQoo3U=
X-Received: by 2002:a37:a9d4:: with SMTP id
 s203mr30204686qke.244.1617725086498; 
 Tue, 06 Apr 2021 09:04:46 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 6 Apr 2021 09:04:35 -0700
Message-ID: <CAO=noty9JPU7L8XXKs48TEC9SrJ6j44boA=6ZQP4b_4Z3oy4Kw@mail.gmail.com>
Subject: IPMI Smbus
To: cminyard@mvista.com
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=venture@google.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Corey;

I saw you have a branch that is working on adding smbus IPMI support
(the ssif approach).

Can you provide details on the status of this work?

Patrick


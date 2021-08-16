Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DA83ED0DD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:09:29 +0200 (CEST)
Received: from localhost ([::1]:45726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFYca-0005vz-L3
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYbA-0004ju-Pz
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:08:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYb9-0003zN-Ah
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:08:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id d11so30457233eja.8
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 02:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P1EVei2AZz1z7WJMNRe1MOYBmUAP2X52s4drAlZ+WdY=;
 b=xuaRW0uy9O3bmOHnI1TCrbT122jHSkc95igQkWUqzwRfaMjeIJi8avXcQZ/8E6xUdw
 A5t4L7L7cDPoMX/1ejCxA8RM3C9WtIb2AVeHCeDUPakGd6YZ0vKzYwb2q6apJXgJYDBj
 l1acGi5GD2pAGUwZvg6g1qTutaIggDoq1Jn0u//knseqoXETOLpQ0mawwmJBcB/TtyFW
 bL0qCUQApEgqXiB/rZrakz90GacjyoyZkYkrj+xxHOiAA1s7DDji5BYPct4pJJtQ8lpQ
 nOFZe+erD60hVYVRiMr718nRMW0upg5SCdNPVknS7wN1f/XmJTdHM3uywk/zHg/LlROY
 wstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P1EVei2AZz1z7WJMNRe1MOYBmUAP2X52s4drAlZ+WdY=;
 b=HPPF/OVZ5158VmsfDVSeCxQgf1DTbJ5xR3ZTlCDNao6LbaVWKPUIQUei/YkS5YQER8
 Ap0W0y+1NIf/z+GmuZ5j8iVU5s+rx/S7dG3DoWhiiW8wGp6wdfFNN0anHL4n2uAnU7qI
 6JV88b6zHvyjPmbsSwic3TnWEFYcj7z8a6dc8kqxQ4TLdBuZbORMUHkuGFTfayj0Av02
 fUYTXbRfVxlsLnVxt6gMuwDiFOpIB/fFg0Mi7pNUPCVtbPBXppncpY1LKGCnSzhlEQbx
 lcYq4dJcjCTFKAMVexCFo7SZ+ROt6o8GThfs2Ate61v55gCHRyyUog2qXC8e25h+UwRi
 /VIA==
X-Gm-Message-State: AOAM531R2PxsZoABA3W2y9uvWFVXYgVY6NzE9dLXwWD6WzxGXd+w3+/p
 069WLkTtFswhPKSe0Xngqn0c74uCTlBybK1mEpuD5A==
X-Google-Smtp-Source: ABdhPJwi1bjNLkcDWbMPNqF7C4s2IWkdhI0EFQZ7A5/CUskKqTroeUEB5F85myZ2rO9LSZNdViZ0UT3/M//TVvCL2WQ=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr15317176ejn.56.1629104877825; 
 Mon, 16 Aug 2021 02:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <1436284182-5063-1-git-send-email-agraf@suse.de>
 <1436284182-5063-25-git-send-email-agraf@suse.de>
 <CAFEAcA9TQKAU94OUuSzYH8A_7CFfSYc+R8-Mz4mai0vwMbjsxA@mail.gmail.com>
 <YRIAr6HIW742LSZd@yekko>
 <CAFEAcA-GGNcm09xu5v65jQcghjBnj6cBtb0p0xYhOPPNt1g_sg@mail.gmail.com>
 <1daaacdf-4725-3350-601f-24025d3944f4@redhat.com> <YRnrn0EeT8apvqFI@yekko>
In-Reply-To: <YRnrn0EeT8apvqFI@yekko>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 10:07:12 +0100
Message-ID: <CAFEAcA9zPiJhPmghVtoWuT_A-JD3fNWkhD6B4t-J=FHaWZf2ug@mail.gmail.com>
Subject: Re: [PULL 24/30] spapr_pci: populate ibm,loc-code
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Aug 2021 at 06:41, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> Indeed.  Revised version below.  I'll only attempt to push this to 6.1
> if we're going to rc4 for other reasons though.

We are doing an rc4, but I don't think we really need this in 6.1,
given that the original leak only happens on a very rare error case
("/sys/ not mounted").

-- PMM


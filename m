Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8BA4D92BA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 03:46:23 +0100 (CET)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTxCY-0002lV-2M
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 22:46:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nTxAT-0001UH-6O
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:44:13 -0400
Received: from [2607:f8b0:4864:20::22c] (port=36371
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nTxAP-00062c-B9
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:44:11 -0400
Received: by mail-oi1-x22c.google.com with SMTP id z8so19534293oix.3
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 19:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=X+xgnjVT5dvbWFzxxQIY+7/8EzBmcrUdOTMsT8yiL/o=;
 b=eMNID8fBiTjqjLcVSF3o9aTqeSuAsi4n6pXSLoVvwVPmFejWf36oDoJReAJVkMh7r7
 A34yDV4EAURcN+MRuPcLaN78u+9aV4Wj3XOuLjTzA00d+gkNMoGNLkBQFFNAVK0YJl0B
 mLTL+IwIC+kb2ujC7VsZafer+iVzSv3lIyq8FbOlO7QJ21kl6TlXHJyRenKloiPbKjdz
 oOQXg98ePM+I0of6VnOGhkqvbHXqMTQW9mrdNtZTEjDlp4THflrvQJKDKh3d4Ophaw8G
 95x0VF324KTEnPIDqkk1IbUjPl0Rl4pypgMysIs81XQUBoUK5OuTIuBikmInwfrf6Yrc
 wx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=X+xgnjVT5dvbWFzxxQIY+7/8EzBmcrUdOTMsT8yiL/o=;
 b=iOrTjnvEi8p/MGHP6zGwpwndl4/FyWvYDQfxMfCIysOcIeTQ0T3MjrsXvAEkIvegzL
 +7oC+9n88gUe46K02BgYUf/g76fdNCYjHFP8nwoL4IhayUJmlZxL5cfYBUUlTwL9Ap9I
 B5RAS0t22yuXGmeXzVwNdgyJIBxxpSadopWdUaptp7Mi77Tb3QdRHH8CIWfdIckUn/Ta
 BGYaJfHr0/k7jmSvahWYPubopuQYVVSSEewKL3CJk/dc4KHaR4hSQZ8sK0mJ6qyaVS2X
 Sh3AkIXIIpn7X17OL1fiOq1XpwB/RHNxmLArbENvTuqwVbTsWWK/ks6g4b6YeHDV8QEt
 0ESw==
X-Gm-Message-State: AOAM530zcB5O0wZXMiT4n2GlgceeeJU+fIycxISiziJBgS6p+xRAM2lf
 NXNNG2Va+4KplD8mz6BVKlAw6C72wnqo4tPcaMvYAQ==
X-Google-Smtp-Source: ABdhPJwXhqEWC/J532gt9SWszAY0/AXTplRbGvHcRraYitjOJm8F5sV+4aCUT2L6p/3PZQEUO2PTuLPmDi6lpydnYrY=
X-Received: by 2002:a05:6808:1115:b0:2ec:e78e:3fc0 with SMTP id
 e21-20020a056808111500b002ece78e3fc0mr842988oih.207.1647312247985; Mon, 14
 Mar 2022 19:44:07 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 14 Mar 2022 19:43:57 -0700
Message-ID: <CAO=notxzs6T4De=MA0xOSZUQ7Tcuh91hyKRA_ZokaMFejXJbkw@mail.gmail.com>
Subject: Lost patch, hw/sensor: enable adm1272 temp with qmp
To: Corey Minyard <cminyard@mvista.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000006084b505da38c5ce"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=venture@google.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -142
X-Spam_score: -14.3
X-Spam_bar: --------------
X-Spam_report: (-14.3 / 5.0 requ) BAYES_40=-0.001, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--0000000000006084b505da38c5ce
Content-Type: text/plain; charset="UTF-8"

I'm going through my team's spreadsheet for our upstreaming efforts to try
to make sure things weren't lost, as sometimes a reply will go into my spam
folder, and I saw this patch also fell under the radar:

https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg01310.html

If you want, I can also do a patch resend.

Thanks,
Patrick

--0000000000006084b505da38c5ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m going through my team&#39;s spreadsheet for our up=
streaming efforts=C2=A0to try to make sure things weren&#39;t lost, as some=
times a reply will go into my spam folder, and I saw this patch also fell u=
nder the radar:<div><br></div><div><a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2022-01/msg01310.html">https://lists.gnu.org/archive/html/=
qemu-devel/2022-01/msg01310.html</a><br></div><div><br></div><div>If you wa=
nt, I can also do a patch resend.</div><div><br></div><div>Thanks,</div><di=
v>Patrick</div></div>

--0000000000006084b505da38c5ce--


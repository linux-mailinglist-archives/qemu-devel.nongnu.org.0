Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB964776BC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:06:22 +0100 (CET)
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtGv-0004xM-Kn
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:06:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mxtEL-0003rP-5X
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:03:41 -0500
Received: from [2607:f8b0:4864:20::930] (port=36677
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mxtEJ-0006yS-PM
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:03:40 -0500
Received: by mail-ua1-x930.google.com with SMTP id r15so48019045uao.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=NHnHtz0q1sdj5N9xqVTMfNZfORE4R6qlqQqQ2bxTP/s=;
 b=tS7ZRljsUSoez/QfAjsiTJhOC5Yq1UPRMmkOCf3rcWzKeZNVoHXhxFNkZNN4DFOW5H
 9tTAJ7ar6NUDC6/y9igl3XYl7csegX5ljB8Wx6c1bDmRNzufHehky6L7nLQFeIO+DnXZ
 04QJo7uccirvYNh+I8yt+m3lRiyJAS0aGTaC8erXlCdbA41PgZ4liPhkqgV9vOEcJc1I
 43lrgLKlQIuscviAi+ocEn2Eb4uDHr3IEAqG9UhVJ0ZDQRfhAcQcobQ8lBsEtPmlK2SZ
 wooT5G+ie7pcdTz5JdwS7t9GU+/GJpg3WOL0gu8VBWxpJ5IdfF8m56bQ4TzO3fcl4nKi
 sGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NHnHtz0q1sdj5N9xqVTMfNZfORE4R6qlqQqQ2bxTP/s=;
 b=Q6BAfM2ib2k8NEZ11mF9uuYpf650c/u+xJIPI3f6/sgOiZfWYzDhZPWNrmH4U81ZZy
 fFfgidEWxS2snaTZdl4Iyq/68jS5mpwY1MGzJIGgqccJOUaXDz7DZHv5hMrSHPtR+P7C
 bc5sEW/KadthtQPPNdEzNLyoeKleP7PCU53LAauNbW8GZtNsVUAwMA4Y6MQ0Fye7ryHQ
 O0qk9ZYTFjqerus9lprgd7hCN5Eh8f/OwZVegdoYq2SXkWD6uVKS1oGBLcZLJWgEFfo4
 9GnPs/qoYNSNAJYdfgjtGDcUUoA4Mc/yAFfLk/bzhi8w9Ppub0I6grs8zd8sUBgKv7HT
 PF6A==
X-Gm-Message-State: AOAM531d8Pqmj0XEC0jkXwVcZJ/4ZclBhvPkUxL60gWnmJDl3YihMDSL
 sL9nCN0ps5tro2CEOIf56e2K8d83+gQqhhuXitKtZuSK6Fs=
X-Google-Smtp-Source: ABdhPJzHRLWuZBpOB3biKzOGmysRccIhjXrf2LePoxMPPVuTFy2saFgchE6GFbFYq1yAW/gpsj3YWpZTcq8y3DIlBTE=
X-Received: by 2002:a67:fa12:: with SMTP id i18mr5644236vsq.49.1639670617648; 
 Thu, 16 Dec 2021 08:03:37 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 16 Dec 2021 08:03:26 -0800
Message-ID: <CAO=notwUAezOS58BBPL4-fzENrUj55Tbdi1Lwvjz1Y_vpc69uA@mail.gmail.com>
Subject: Introducing PECI support in Qemu
To: QEMU Developers <qemu-devel@nongnu.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Titus Rwantare <titusr@google.com>
Content-Type: multipart/alternative; boundary="000000000000b71a2805d3459041"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=venture@google.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -140
X-Spam_score: -14.1
X-Spam_bar: --------------
X-Spam_report: (-14.1 / 5.0 requ) BAYES_50=0.8, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
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

--000000000000b71a2805d3459041
Content-Type: text/plain; charset="UTF-8"

Hi all;

My team has a working PECI bus/device in Qemu, but we only have internal
board specifications that enable it.  We'd like to upstream it as soon
as possible, but obviously we can't enable testing for it without an
upstream board that uses it.  We only have it attached to Nuvoton 7xx
presently, but are slated to enable it for the Aspeed series in the
next quarter.

Does anyone have an upstream Nuvoton 7xx series BMC board that has PECI
enabled in the DTS, where we can enable it to their qemu board to enable
the upstream testing? (think: qtest).

Patrick

--000000000000b71a2805d3459041
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all;<div><br></div><div>My team has a working PECI bus/=
device in Qemu, but we only have internal board specifications that enable =
it.=C2=A0 We&#39;d like to upstream it as soon as=C2=A0possible, but obviou=
sly we can&#39;t enable testing for it without an upstream board that uses =
it.=C2=A0 We only have it attached to Nuvoton 7xx presently, but are slated=
 to enable it for the Aspeed series in the next=C2=A0quarter.</div><div><br=
></div><div>Does anyone have an upstream Nuvoton 7xx series BMC board that =
has PECI enabled in the DTS, where we can enable it to their qemu board to =
enable the upstream testing? (think: qtest).</div><div><br></div><div>Patri=
ck</div></div>

--000000000000b71a2805d3459041--


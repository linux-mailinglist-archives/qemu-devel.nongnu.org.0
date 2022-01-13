Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D948448D072
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 03:32:04 +0100 (CET)
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7puF-0001Qs-Cp
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 21:32:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgfbeta@me.com>) id 1n7psF-0000c8-W6
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 21:30:00 -0500
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgfbeta@me.com>) id 1n7psE-0005vw-HY
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 21:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1642040995; bh=G+dhqPj8D9Yj04ZUh0QBg6F4RuWPEIZxa3WtHpOLqoQ=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=PC891wSmGGbStqPbwgDHbQQPVjbSFWIyJQTDAbkjeZC9DWfudYzvkjlMUO05gVd68
 MMxnmJ78AkVLF5UfZyz+8jAb7YEV4YNRk7faFqXRQYQ85JYCs3egG4L4NRtctZJXAX
 p4AtIOk4m8hIz8DsuDp0DMalFfhliwpw4HUj3gowTV9kvlwri0RcgR+XUwWxE+cm19
 3VQyJ41gWidOimXr6yyYcVudjZkrYWSuRkSpyaLn78vqKyZiIgFcglOohW/1wlAbD0
 be9pjj7xAMgDej2b0nLetq/TtoMc/ht4PeU65AtBDLZ5seXogT4lTx0yskbss+a6Xg
 J5vTChYjaPFwA==
Received: from smtpclient.apple (unknown [111.163.120.4])
 by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 43092800478;
 Thu, 13 Jan 2022 02:29:53 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] ui/cocoa: capture screencast with AVAssetWriter
From: Chen Zhang <tgfbeta@me.com>
In-Reply-To: <CAFEAcA_zFwoCSXhqSbEmT=sKTZUvHu+vBzxDwF-6ECbeeUXeMQ@mail.gmail.com>
Date: Thu, 13 Jan 2022 10:29:50 +0800
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CE203C26-67F3-402C-8DD0-6CF97063C15D@me.com>
References: <20220111070258.2983-1-tgfbeta@me.com>
 <CAFEAcA_zFwoCSXhqSbEmT=sKTZUvHu+vBzxDwF-6ECbeeUXeMQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2022-01-13_01:2022-01-11,
 2022-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2201130008
Received-SPF: pass client-ip=17.58.6.52; envelope-from=tgfbeta@me.com;
 helo=pv50p00im-tydg10011801.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Granted that this patch might not fit for main branch, I hope this =
snippet could help someone in need.

Screen cast feature shipped with macOS does support screen recording, =
but only for whole screen or selected rectangle, not for a selected =
window like photo capture feature.

And pixels are not sourced from qemu display frame buffer. This means =
the screencast would be scaled by contentsScale (for retina screen) and =
window titlebar would be included.



Best Regards

> 2022=E5=B9=B41=E6=9C=8811=E6=97=A5 =E4=B8=8B=E5=8D=884:31=EF=BC=8CPeter =
Maydell <peter.maydell@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, 11 Jan 2022 at 07:09, Zhang Chen <tgfbeta@me.com> wrote:
>>=20
>> To record screencast, AVAssetWriter APIs were called for each
>> cocoa_update call.
>>=20
>> Commands for start/stop recording were added to View menu.
>=20
> This seems a bit of an odd feature -- why doesn't the OS just
> permit screen recording of any application without the app
> having to have code for it specifically ?
>=20
> -- PMM



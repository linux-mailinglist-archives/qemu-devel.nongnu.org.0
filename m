Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE716D295C
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 22:24:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piLHs-0006FC-8r; Fri, 31 Mar 2023 16:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1piLHp-0006EZ-4y
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 16:23:49 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1piLHm-0002Q9-JZ
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 16:23:48 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B62325C00CA;
 Fri, 31 Mar 2023 16:23:41 -0400 (EDT)
Received: from imap42 ([10.202.2.92])
 by compute1.internal (MEProxy); Fri, 31 Mar 2023 16:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1680294221; x=1680380621; bh=L7aM2rQC34GtoxtvfgmG3H9yC64rRDO7C2A
 0+YMP3nM=; b=mN0/2pi3V2lfALcs/g5hQJX0OFwgI7xjy8BmcBani3nClxgbg2v
 sKqwo0VhQwXbI8el9aH4AAr5OeyNOy/jwPK9fcpMKMa+6b5gGqYPveNPlnmwEZTI
 BjH2E5h+641WlXz9L4k5S6O0qsg2El0noFNCAMMNpaEl3qH0Gk3boAxiueTBbP69
 GzJWfehYB6K45TjqmFgqsHOtAypI6PLcIJ41tdnmGaXaudw2SCfGd+rVICIwCbXy
 VaqA0Dy16vOgUiqb/PSdaRSYBYUP3kuO0tmKbH3r7cM/5EC8ETn9a1Z6n+xX/Ixf
 thteaZzSFQDZU7J3Auqp8McGLGRxMoeOkiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680294221; x=1680380621; bh=L7aM2rQC34GtoxtvfgmG3H9yC64rRDO7C2A
 0+YMP3nM=; b=hG9qEQEdyG7pqZNeR5k8/5R7LMItHyUSse4pTAUNjC+qNyr53EJ
 ROUjYsCWB1L3xHxUka9W4ZbcFyC/viUIZw89sOBI/7C0AIicxzbJVxjKSSGKZrKc
 4CwcADzv5GMSPcCQtW2s2bGtvvLPJIgYSTjkrz+5sPlSwFEoDJWoX+1QOwKCVFL0
 s4k7GJvhwSC8aK4APfMyuZkRm0KyBr/KoNCt9/upKq2V+RnwSHU2afIT9X8emeRC
 1T6cLSRAQk+r2nzS/sQJYzou00MNPzA3Vx5lY2jbnfPw2kzi3r0sAfvvAxBJQ5yW
 m1GCm88HX/cj67WJPrq0QzJgtDab/HXcXUg==
X-ME-Sender: <xms:TUEnZKdqYYsDSLelnjKf-LhC5z6gKZUzy_AWV9DBTTDKVdeVKMuzZA>
 <xme:TUEnZEOPNkpGW8quHgNU_8-bdrEXKUHixZCuchiBL2pM81ahiRFE8qL560eUSMUQF
 QDbTZ2dewLBs8aAFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepofgfggfkjghffffhvfevufgtgfesthhq
 redtreerjeenucfhrhhomhepfdffrghnihgvlhcuighufdcuoegugihusegugihuuhhurd
 ighiiiqeenucggtffrrghtthgvrhhnpeevheduteefvddthfdvgfehjeejtdfhieeigffg
 gfduvdfftdevleejleelfeeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:TUEnZLiJFcF8v7JcshEdzcpXVFIugSaehBS3pPFrHApXsSzmziiCWg>
 <xmx:TUEnZH9faloendLpKap0tGM-UZ1u4SNi1WlKR0T8G4_dyZ-bwuFtzQ>
 <xmx:TUEnZGuHbngs8651EDLU_8VlmP2Z04tel2gW2KArQQhzO1iaT95xAg>
 <xmx:TUEnZP72nPAYr7yV0hz3TL7mjac2QZNhOv065BEyzYg7a6550iFWXw>
Feedback-ID: i6a694271:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4DE3EBC007C; Fri, 31 Mar 2023 16:23:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <4d1cc7a0-54a6-4a7c-87a9-5bc643a0162f@app.fastmail.com>
In-Reply-To: <ZBwbQCxg+aDuofY+@redhat.com>
References: <cover.1679530587.git.dxu@dxuuu.xyz>
 <9b355e4fe0574022459c0fd94ed30de3b7415011.1679530587.git.dxu@dxuuu.xyz>
 <ZBwbQCxg+aDuofY+@redhat.com>
Date: Fri, 31 Mar 2023 14:23:21 -0600
From: "Daniel Xu" <dxu@dxuuu.xyz>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: kkostiuk@redhat.com, michael.roth@amd.com,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 2/3] qga: Add `merged` variant to
 GuestExecCaptureOutputMode
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.28; envelope-from=dxu@dxuuu.xyz;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Daniel,

On Thu, Mar 23, 2023, at 3:26 AM, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Mar 22, 2023 at 06:19:27PM -0600, Daniel Xu wrote:
>> Currently, any captured output (via `capture-output`) is segregated i=
nto
>> separate GuestExecStatus fields (`out-data` and `err-data`). This mea=
ns
>> that downstream consumers have no way to reassemble the captured data
>> back into the original stream.
>>=20
>> This is relevant for chatty and semi-interactive (ie. read only) CLI
>> tools.  Such tools may deliberately interleave stdout and stderr for
>> visual effect. If segregated, the output becomes harder to visually
>> understand.
>>=20
>> This commit adds a new enum variant to the GuestExecCaptureOutputMode
>> qapi to merge the output streams such that consumers can have a prist=
ine
>> view of the original command output.
>>=20
>> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
>> ---
>>  qga/commands.c       | 25 +++++++++++++++++++++++--
>>  qga/qapi-schema.json |  5 ++++-
>>  2 files changed, 27 insertions(+), 3 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Is there anyone in particular I should CC to get this series merged?

Thanks,
Daniel


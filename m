Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D666A1E57
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:17:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZoE-0002A1-9M; Fri, 24 Feb 2023 10:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVQ2d-0003DA-VX
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 23:50:44 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVQ2c-0001X1-2O
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 23:50:43 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D0F25C01BA;
 Thu, 23 Feb 2023 23:50:40 -0500 (EST)
Received: from imap42 ([10.202.2.92])
 by compute1.internal (MEProxy); Thu, 23 Feb 2023 23:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1677214240; x=1677300640; bh=2JfeHpe8ux
 fwwYBtUfaNLkfoW9j/SvYIp8XGXIfS7Bc=; b=YVVC+8KFRxEpYi2dicOuCYMttr
 EDN1CD+trbUEa/9P7lq/CH945YIVPITPJhBQyF2/FnynSju+PMNpnoN/UEVg5DTH
 r7xKCWF44CSxY6i0lXjWekC3utBFgA5+rLQXGa/ZI+39WFGFRPRPdgUEj4Jz+3+s
 5sr0RRnDBnQSoJghyTOqKQrdT9b4WZ89OzFnkGhnMFZDqBRqMilIrdYfWhpMEG8X
 C6LC94DeiPgYPBwODUeICFhINM7aJRcHYWMHsoWHdnxSEN+Woub7tMsedmzTmWwr
 OfujNgHGm+dxHwZ8G7p9/d1xMYL6YtO+tPtwi4c6IiqcPl/WXI6whcxjgmlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677214240; x=1677300640; bh=2JfeHpe8uxfwwYBtUfaNLkfoW9j/
 SvYIp8XGXIfS7Bc=; b=f/f0pIdoaV3R464gtG0uHJ9gszyeN8S8KAfjrzb7pGx3
 XY8ESPtZqWIVkwHekqi4xve94WkaSILAG//ZYRTHshWm5CIUiCJagYVCytvI2bhq
 FoykO3G81JsEsGqW9X3dmDrN3Ps7rUWIsrwZF1dq8GlHemsyt8YfdmweLEqcyb5m
 o+6c82ko26MwCh/jeLJifh5NiabEa2VV5AfrcULtO/DGVMxzI9PM49U7RDOdOyIT
 J1pG1T4Bu69PhsikNOtcNvCfIGaTMFjQ+5Tc1cavdEUaGcx4oPsFc/NrAppPmUeK
 Oi44f9gmOsUJlrq5ypGDtt/+k6VcXJ9dcoh7G8ZWUQ==
X-ME-Sender: <xms:IEL4YzI-RVDRfN8b2RlquA2GOXwA0JzgLJBvRfC-k538Qe5J_tLLrg>
 <xme:IEL4Y3KDal03nu0WkywZuRHIj5b6J4gk4I2K1dmQoVgXyAaSE1uWjdtR4sAe8wEC9
 MPkqZAJE4nJInhpDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpefofg
 ggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdffrghnihgvlhcuighu
 fdcuoegugihusegugihuuhhurdighiiiqeenucggtffrrghtthgvrhhnpedtudehudfhve
 duieeikeejudeljeffuddtieffieeljedtudehhfekheehuedvkeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegugihusegugihuuhhurdighi
 ii
X-ME-Proxy: <xmx:IEL4Y7u76njj4evNCZtVoKNt1kvSIa14-OhubAxo808wuk7mSb-_pA>
 <xmx:IEL4Y8Zc49_zUNN4tlRIr8Hfka_xf-ekcwMBW8Dy-UzczDXKbXpzJQ>
 <xmx:IEL4Y6Yo9A-1eutO47_rmPOPWKzpEWLB84QcMdaFdn2GRcEJPMcpDw>
 <xmx:IEL4YzB1L9BQbWuAs6P7-MFFAGsiiP-Q6f9tTt16axlODnfPHlvxrQ>
Feedback-ID: i6a694271:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 282B1BC0078; Thu, 23 Feb 2023 23:50:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-172-g9a2dae1853-fm-20230213.001-g9a2dae18
Mime-Version: 1.0
Message-Id: <5855a5c0-1359-49e7-944c-579eb5f59402@app.fastmail.com>
In-Reply-To: <cover.1677197937.git.dxu@dxuuu.xyz>
References: <cover.1677197937.git.dxu@dxuuu.xyz>
Date: Thu, 23 Feb 2023 21:50:19 -0700
From: "Daniel Xu" <dxu@dxuuu.xyz>
To: michael.roth@amd.com, kkostiuk@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] qga: Add optional `merge-output` flag to guest-exec
 QAPI
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.27; envelope-from=dxu@dxuuu.xyz;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Feb 2023 10:16:11 -0500
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

On Thu, Feb 23, 2023, at 7:05 PM, Daniel Xu wrote:
> Currently, the captured output (via `capture-output`) is segregated into
> separate GuestExecStatus fields (`out-data` and `err-data`). This means
> that downstream consumers have no way to reassemble the captured data
> back into the original stream.
>
> This is relevant for chatty and semi-interactive (ie. read only) CLI
> tools.  Such tools may deliberately interleave stdout and stderr for
> visual effect. If segregated, the output becomes harder to visually
> understand.
>
> This patchset adds support for merging stderr and stdout output streams
> via a new QAPI flag.
>
> Daniel Xu (3):
>   qga: test: Use absolute path to test data
>   qga: Add optional `merge-output` flag to guest-exec qapi
>   qga: test: Add tests for `merge-output` flag
>
>  qga/commands.c        |  13 +++-
>  qga/qapi-schema.json  |   6 +-
>  tests/unit/test-qga.c | 135 ++++++++++++++++++++++++++++++++++++------
>  3 files changed, 133 insertions(+), 21 deletions(-)
>
> -- 
> 2.39.1

Apologies for spamming the list. I thought my mail provider
was swallowing my sends but it looks like the list was a bit
slow.

Thanks,
Daniel


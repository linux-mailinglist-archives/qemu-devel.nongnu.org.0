Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C978A617FF4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 15:49:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqbWP-0005gE-M7; Thu, 03 Nov 2022 10:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1oqbWD-0005fK-NI
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 10:48:33 -0400
Received: from out-55.mta0.migadu.com ([2001:41d0:1004:224b::37])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1oqbWB-0003cf-IW
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 10:48:33 -0400
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
 t=1667486907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbTrSabrZqr4N3H6QdNezHYUsdXE4C+ocEhz8OlugsM=;
 b=PNPImDHy8a2lNv7wi7nJTsqJwR8pq7KPWKCouroSHXOdgsCLXID2o3Q9SrW+q6XwsGl6Oa
 y5DEiAKGz5T6QlU/8HrtoOXOxwx7S7F+JMzIdIdqclT+7B4MmDA0ZzIkKGuASCz96qwNTl
 krladFwbZ+tCS2bpG1Hlpbgg0ShsBF+bHDSuwua2EYKX4w3d+ww0HfYcWmoZ0Wp+LLuPKP
 PCxsMee4tpZi+9afVEvRggcY94AQDEcZXk4bEevZcl1XqPy39dT9cDu5GTkIW4gWKkzhkD
 lWq82Hzp1z+dP++Rvb+LSXOvKo/gxG9cK1QcE8ZSFvBNI3OpGhbhPq2AFzsNdg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Nov 2022 15:48:26 +0100
Message-Id: <CO2QRXNAEZ43.3W18J8CMRP86I@taiga>
Subject: Re: [PATCH] linux-user: implement execveat
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Drew DeVault" <sir@cmpwn.com>
To: "Laurent Vivier" <laurent@vivier.eu>, <qemu-devel@nongnu.org>
References: <20221031084030.2125288-1-sir@cmpwn.com>
 <01e85f0c-2dbc-7ebe-793a-c05818b8ce8c@vivier.eu>
In-Reply-To: <01e85f0c-2dbc-7ebe-793a-c05818b8ce8c@vivier.eu>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:1004:224b::37;
 envelope-from=sir@cmpwn.com; helo=out-55.mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

You're right, that's a much better approach. New patch coming up
shortly.


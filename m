Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C4321ABB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:05:16 +0100 (CET)
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEClu-0001HG-NG
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1lECci-00025R-Hm
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:55:44 -0500
Received: from pv50p00im-ztdg10011201.me.com ([17.58.6.39]:35140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shen.mengjiao3@icloud.com>)
 id 1lECce-0001hI-6K
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1614005737;
 bh=k0SmPA0q+OU3NbFhB07Lbh7ZCHf3gLzW5duLilMhi5w=;
 h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
 b=CGCq3lbxN77qvDccXjOZjoucyvvcUVGTn5LwanmAQ8KkvQ/nX9WiN7iemHuWVRc/y
 7vDzR4U6ZUASmoTtx53D1fnMWewZn+mKOi14hAfMzx+8GcROFWINs1VDwTqH8ME6f4
 3ZZI5R8n4yogeA647FMM30YOtpZF3hr7CB9bN9QJLMU65nneAli3BlG9JsEdIxsazZ
 hc7zbwnHMCZ1pV27UKN/1Pe7b1eO/09UuOliSXKvh3QvxzSs8KvlQWq827WPFV9Vkj
 MOdDg+A5z7KRTCYez2FkH8DfcYHrZKNt6NGI8cKhSuX+0Q/62IisxxPU2/dTJmNXBc
 eKkHOA3b4pO/w==
Received: from [192.168.50.241] (unknown [139.227.197.244])
 by pv50p00im-ztdg10011201.me.com (Postfix) with ESMTPSA id 7AF8E2A05C6;
 Mon, 22 Feb 2021 14:55:35 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?B?5rKI5qKm5aej?= <shen.mengjiao3@icloud.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 22 Feb 2021 22:55:15 +0800
Subject: Any reason we need memoryregionsection
Message-Id: <6E9673F8-73FA-4AF9-9BDB-75143B4DD57C@icloud.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
X-Mailer: iPhone Mail (18D52)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_02:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=579 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2102220139
Received-SPF: pass client-ip=17.58.6.39;
 envelope-from=shen.mengjiao3@icloud.com; helo=pv50p00im-ztdg10011201.me.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Usually when we add memory region in the platform init process, the correspo=
nding address range in address space will not overlap with others, I=E2=80=99=
m not sure in which case we should use MemoryRegionSection? Thanks=20


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367C3505706
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 15:47:49 +0200 (CEST)
Received: from localhost ([::1]:34370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngRjH-0007c8-4w
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 09:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <this-is@afront.me>) id 1ngRRk-00006R-7G
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 09:29:40 -0400
Received: from out1.migadu.com ([91.121.223.63]:48179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <this-is@afront.me>) id 1ngRRh-0003s2-DK
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 09:29:39 -0400
Content-Type: multipart/alternative;
 boundary="------------RNybD0Ks5wcPcQ0VsjDUbuXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=afront.me; s=key1;
 t=1650288573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=2I6EhBPv60OvQhrCAyN/bS8MMZhyq8JoMSJLWWmj1+A=;
 b=DTrAKxy2uPapDKmdF36tcp8AePsnTBubpUYEao8bdxDd8ExoiFfpsGqNdRT1bMiKt//MVj
 Apf2MtTUIBkD8rcBPH+WvZsC+L/rh+Sd06a4+8RAPZArV7apfOkl/dLsyZztC06O1atLTP
 YA10airdEfmN9wTHvAGcKhHgDK/KSdI2hLO3Y2909o1Z9w2c7OaaureOT0yUpakVRNFoT7
 b+R3fXCqtiwE0Py/D3iQlFwRl/VhAks31d6cq5S1ibi907epY+bsxs73+NxyfbWgZ+YHoD
 N7T54PAHjggBpWrs1WXsp6v+czRfrAo4MAE49WU7Vw7doQ731vlbN7xwF2Qy5w==
Message-ID: <6e14a95b-2bfe-3880-6c6d-766a1cc4014c@afront.me>
Date: Mon, 18 Apr 2022 22:29:27 +0900
MIME-Version: 1.0
Content-Language: en-US
To: qemu-devel@nongnu.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Afront <this-is@afront.me>
Cc: stefanha@gmail.com, philmd@redhat.com
Subject: [GSoC] Adding RPi4 support to qemu-system-aarch64
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: afront.me
Received-SPF: pass client-ip=91.121.223.63; envelope-from=this-is@afront.me;
 helo=out1.migadu.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Apr 2022 09:46:37 -0400
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

This is a multi-part message in MIME format.
--------------RNybD0Ks5wcPcQ0VsjDUbuXl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I would like to propose adding RPi4 to the list of supported machines 
for `qemu-system-aarch64` as my GSoC project, but I'm not sure if it's a 
suitable idea for GSoC since it might be too simple. In addition, there 
is already ongoing progress here 
<https://patchew.org/QEMU/20201018205551.1537927-1-f4bug@amsat.org/>, 
but the last update is from a year and a half ago, and it is stated not 
complete as "more firmware properties" still have to be implemented.

Thanks,

Luke

--------------RNybD0Ks5wcPcQ0VsjDUbuXl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi,<br>
    <br>
    I would like to propose adding RPi4 to the list of supported
    machines for `qemu-system-aarch64` as my GSoC project, but I'm not
    sure if it's a suitable idea for GSoC since it might be too simple.
    In addition, there is already ongoing progress <a
      moz-do-not-send="true"
href="https://patchew.org/QEMU/20201018205551.1537927-1-f4bug@amsat.org/">here</a>,
    but the last update is from <span class="timestamp" title="Oct. 18,
      2020, 8:55 p.m.">a year and a half ago, and it is stated not
      complete as "more firmware properties" still have to be
      implemented.</span><br>
    <br>
    <p>Thanks,</p>
    <p>Luke<br>
    </p>
  </body>
</html>

--------------RNybD0Ks5wcPcQ0VsjDUbuXl--


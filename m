Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6153389F6A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:04:55 +0200 (CEST)
Received: from localhost ([::1]:38108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdfq-0005Mx-Ts
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljdZz-0004Se-GU
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljdZt-0001IT-K2
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621497524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+94D8PtqrjzB22ow5SchtZr/dBe5FietW3t9c/G2vps=;
 b=RaxU5wmjVsp0XuA2OufUF+/LI0T9EV7G/Q5t02Qmm5dK94MqKHQkKK+thztc3Abs4wSl0s
 4l3c8kCFeDgxGfzbS7NBg+OcH4/Ptg51ARdKLoNenTMghuO+JNwTNGUbH9pz1JHKOb1MKp
 Xh2nKvYSLeeG4sToBOH33+1uTZj+88k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-BeJHQNX-NIuJMriO3Fgr6A-1; Thu, 20 May 2021 03:58:43 -0400
X-MC-Unique: BeJHQNX-NIuJMriO3Fgr6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD0AE61259;
 Thu, 20 May 2021 07:57:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BB1D1007606;
 Thu, 20 May 2021 07:57:46 +0000 (UTC)
Subject: Re: [PATCH v3 00/10] gitlab-ci: Ease forks pipeline workflow
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210519185504.2198573-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9a7b1792-833d-27bf-a337-2e73c6256044@redhat.com>
Date: Thu, 20 May 2021 09:57:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210519185504.2198573-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/2021 20.54, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.
> 
> Hi,
> 
> Gitlab recommends to use job templates. To be able to re-use /
> include templates, they can not use YAML anchors. All current jobs
> has first to be converted to use the 'extends' keyworkd.
> This is the first part of this series (already reviewed).
> 
> The second part extracts various generic jobs (which can be reused
> by forks) as template.

Thanks, queued it to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas



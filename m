Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E59F2B0794
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:34:14 +0100 (CET)
Received: from localhost ([::1]:50074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDfx-00054X-8S
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdDf4-0004YY-Jo
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:33:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdDf1-00012c-Bx
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605191594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=herrlPz7qD0QKAF99GkEDHSf0A948V3alNO1GQjnQ6Q=;
 b=M6euXfLPrk1T6DEMeMGdzzvNJXQ67zSVI2aqMm+9meUWyKdCZ3UvpLx8vku9itmpSzGxAE
 wzOoLTUGwUQlyWTs9T573ZI562kBiix7aT248kQgl/ZnQGW33sWmz0aPDeB23bwBy+hNuV
 88z042AAmbuOfgzK/xoLF4O+UM2Ljx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-UpF110IaNTyd8xo7LCBlWA-1; Thu, 12 Nov 2020 09:33:12 -0500
X-MC-Unique: UpF110IaNTyd8xo7LCBlWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECEEC1882FA3;
 Thu, 12 Nov 2020 14:33:10 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-37.ams2.redhat.com
 [10.36.114.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28FDD26329;
 Thu, 12 Nov 2020 14:32:59 +0000 (UTC)
Subject: Re: [PATCH for-5.2 04/10] vhost-user-blk-test: rename destroy_drive()
 to destroy_file()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-5-stefanha@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e3d13da4-823f-2b55-ed89-40832862d272@redhat.com>
Date: Thu, 12 Nov 2020 15:32:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111124331.1393747-5-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.20 13:43, Stefan Hajnoczi wrote:
> The function is used not just for image files but also for UNIX domain
> sockets (QMP monitor and vhost-user-blk). Reflect that in the name.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   tests/qtest/vhost-user-blk-test.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

[...]

> @@ -731,7 +732,7 @@ static char *start_vhost_user_blk(GString *cmd_line, int vus_instances,
>           sock_path = g_strdup(sock_path_tempate);
>           fd = mkstemp(sock_path);
>           g_assert_cmpint(fd, >=, 0);
> -        g_test_queue_destroy(drive_destroy, sock_path);
> +        g_test_queue_destroy(drive_file, sock_path);

s/drive_file/destroy_file/, I think :)

>           /* create image file */
>           img_path = drive_create();
>           g_string_append_printf(storage_daemon_command,
> 



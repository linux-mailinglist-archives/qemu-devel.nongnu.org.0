Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA236B47B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 16:06:05 +0200 (CEST)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb1sC-0000q0-Me
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 10:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lb1qh-0008Jf-LP
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lb1qf-0004X1-96
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619445868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnRBV8v3RN9lyBL1Ffo77rzHFySgNwuCom93Bd6uTWI=;
 b=NQmLTkIo8LEO3c9hnxq3na/cemulOu5fnIxkc3RX5Fj5lLW1aMA5nhXjLfOBC3ozsfKEo2
 Gi5bJDTfPdj6DfceHF1Hpp3htOPuiiaYK/x0Db7eEK8qK142y4UXZP9h7lQUXT/MLjf50l
 b+ZRqZj1K5nq9lQM0VIM3cB/n3lQ6cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-caaEp7OBP9OR0pxiI_id4g-1; Mon, 26 Apr 2021 10:04:26 -0400
X-MC-Unique: caaEp7OBP9OR0pxiI_id4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1733E100A608;
 Mon, 26 Apr 2021 14:04:25 +0000 (UTC)
Received: from [10.36.112.156] (ovpn-112-156.ams2.redhat.com [10.36.112.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B544560C37;
 Mon, 26 Apr 2021 14:04:19 +0000 (UTC)
Subject: Re: X on old (non-x86) Linux guests
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, balaton@eik.bme.hu, kraxel@redhat.com
References: <YIaPdjz7PpvwVPP/@work-vm>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <94728962-8306-4849-7e54-e01b04f3ddc4@redhat.com>
Date: Mon, 26 Apr 2021 16:04:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIaPdjz7PpvwVPP/@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/04/2021 12:01, Dr. David Alan Gilbert wrote:
> Hi,
>   Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
> under QEMU which was pretty neat.  But I failed to find a succesful
> combination to get X working; has anyone any suggestions?
> 
>   That distro was from around 2000; the challenge is since we don't have
> VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
> doesn't want to play with any of the devices.
> 
>   I also tried the ati device, but the accelerated mach64 driver
> didn't recognise that ID.
> 
>   Has anyone found any combo that works?
> I suspect using one of the existing devices, lying about PCI ID, and
> then turning off all accelerations might have a chance but I've not got
> that far.
> 
> [Alpha took a bit of a fight; none of the SCSI controllers were
> happy, but the CMD646 worked well enough to install off a CD image
> from a -kernel passed in ]
> 

Did you try to use kernel framebuffer with X fbdev driver?

Thanks,
Laurent



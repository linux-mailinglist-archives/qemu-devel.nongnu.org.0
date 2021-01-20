Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4A2FD49E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:55:34 +0100 (CET)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FpV-0006gr-Ui
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FcZ-0003KP-Mr
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:42:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FcW-0007FX-Gh
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611157326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UC2rBad/7mTuOkkTjgTqPD/vK8uoQCv6UqyYQ29UiQ=;
 b=U3hg7WtulZl3xKmdheoYgbr+26JlE1E0Y8WP0BGtttIGMk4H/uovQmncbddTRjt+6nd6mi
 qy6zGXJ1tXl2jlXMl7MQGCqz6L14fgmzB6yUKyvHqq7nkuFdhg7LC4aR6qsS8m61/kR416
 KSF5m8Y0c5XSNtIbi57OxlrSyrS9HeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-BxtfLTcsOFu0MVnqf1HKLg-1; Wed, 20 Jan 2021 10:42:03 -0500
X-MC-Unique: BxtfLTcsOFu0MVnqf1HKLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F17C2100C631;
 Wed, 20 Jan 2021 15:42:00 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2895B5C728;
 Wed, 20 Jan 2021 15:41:59 +0000 (UTC)
Subject: Re: qemu broke booting of old RedHat floppies
To: Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
References: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@msgid.tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b7f858e1-5fdf-44c5-cc4e-033c43df9c4e@redhat.com>
Date: Wed, 20 Jan 2021 16:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 20/01/2021 16.11, Michael Tokarev wrote:
> As someone noticed on IRC, old (2.x) RedHat floppies does not boot
> in current qemu.  When qemu is booted from floppy image at
>   https://archive.org/details/RedHatLinuxBootDisk521998
> (download the "ISO image" link there, it really is an 1.44 floppy),
> seabios says Boot failed and that's it.
> 
> I run git bisect with it, knowing that qemu 2.1 works fine, and
> it pointed out to this commit which is oldish qemu-2.5+:
[...]
> Now, I don't even know where to put that "type=144/288/auto" thing,
> I tried this:
> 
>   -drive 
> file=RedHatLinuxBootDisk521998.disk1of1.img,if=floppy,format=raw,type=144
> 
> but it says that format=raw does not support "type=144" option.

Try:

  qemu-system-x86_64 -drive 
if=none,file=RedHatLinuxBootDisk521998.disk1of1.img,format=raw,id=dr1 
-device floppy,drive-type=144,drive=dr1

> And it's even more: I don't remember which size should be an 1.44Mb floppy :))
> The file size of that image is 1492992 bytes which does not look like it is of
> standard size, but I can't find which size it should be.

As mentioned on IRC already, it's likely a disk with 81 tracks instead of 80 
tracks, so it's bigger than the usual 1.44 MB floppy disk images and thus 
QEMU likely misdetects it by default.

  Thomas



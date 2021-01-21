Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305322FE839
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:59:18 +0100 (CET)
Received: from localhost ([::1]:50754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2XgL-00031l-6u
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2XfD-0002YX-7C
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2XfB-0002W7-KO
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611226684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kcNhMovp1q12LOU48z2z0Ot185RibE61dGo8WUzKuQQ=;
 b=b5rZHK0PY/h4CpE0eB3u/g0TViks2GhWEq0l4z/XadarZJZlInOfkUYe/OWD3oIE2UHHD6
 pQ3YAzGR6vA+o2FyOdP8uoX36bxf4O2s6KEFLh1RyJza3Ttgokssi5XgwA4JkTUdggwVi8
 a3RwSLkWZg5OEJHRxEqNMPVvO19gDSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-ilNW8fM4MmCrF-YXHKCs_A-1; Thu, 21 Jan 2021 05:58:00 -0500
X-MC-Unique: ilNW8fM4MmCrF-YXHKCs_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B926B107ACE3;
 Thu, 21 Jan 2021 10:57:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-82.ams2.redhat.com [10.36.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8167648A1;
 Thu, 21 Jan 2021 10:57:57 +0000 (UTC)
Subject: Re: Migrating to the gitlab issue tracker
To: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <bda4f471-8ed6-3832-29ac-279a6d3bb7cc@redhat.com>
 <20201029174114.47e2b351.cohuck@redhat.com>
 <CAKmqyKOY+5WcxUg3Rvq2t3vYWOHrHQdhcv8PkiqZX2zVMdqJ3Q@mail.gmail.com>
 <3713093e-bf3b-bf23-a8d0-70fe429032ba@redhat.com>
 <c7308133-cf29-8668-f781-6d025eb16722@redhat.com>
 <3d9b264a-5e1f-b936-8455-bafc6b89ebe5@redhat.com>
 <20201030092324.GC99222@redhat.com>
 <CAFEAcA_8PKkfeninOXCzPdtY7WVHnC7Pkon758zXe7h9MzS+aw@mail.gmail.com>
 <20201030101013.GG99222@redhat.com>
 <CAFEAcA9crYaa8-guWkYFDYgEi8=gH3xaXraD7iWZMHM6vryAtw@mail.gmail.com>
 <c75f91b7-6972-9e48-efa9-49792fc011d2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d4dd9e44-9023-b655-b23f-cf139b178bf0@redhat.com>
Date: Thu, 21 Jan 2021 11:57:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c75f91b7-6972-9e48-efa9-49792fc011d2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair23@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/11/2020 01.06, John Snow wrote:
> On 10/30/20 6:57 AM, Peter Maydell wrote:
>> On Fri, 30 Oct 2020 at 10:10, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>> This
>>> makes it more appealing to leave existing bugs in the LP tracker until
>>> they are resolved, auto-closed, or there is a compelling reason to move
>>> to gitlab.
>>
>> The compelling reason is that there is no way that I want to
>> have to consult two entirely separate bug tracking systems
>> to see what our reported bugs are. We must have an entry
>> in the new BTS for every 'live' bug, whether it was originally
>> reported to LP or to gitlab.
>>
> 
> OK. I will try to investigate using the Launchpad API to pull our existing 
> information, and then using the Gitlab API to re-create them. We will lose 
> things like the list of subscribers and account information. Tags, Priority 
> and Status can be preserved as labels. I'm not sure what the fate of 
> attachments and other things are yet, I will see.

  Hi John,

since we are switched now the main git repo to gitlab, and many of the 
incomplete bugs on Launchpad already expired, what about switching the bug 
tracker to Gitlab now, too? How far did you get with your migration scripts?

  Thomas



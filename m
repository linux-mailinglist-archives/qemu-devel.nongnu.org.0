Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE44133C5F1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:43:33 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsBg-0000qP-PD
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLrje-0002GY-QC
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLrjd-0004z4-02
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615832072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+ZOsFFAdnTs7FEk7ryoRqbnpipsNqnb1bNQm4gkfdA=;
 b=bKGdVui60pdEhFJ+xRI4hLCWTiYvlCTDiMV8Wq8iW8g9ZI0LWWbdauhlWeQ1SDDz5xgi1N
 ykhzBZw2XUyFxaBQpxTBXCc6NfqVANvM45B+kFFv3ijSPaUrPcXtNXDJcJCXPkab1Y5kYC
 OTgMYf3mM09K0p2nKDy84DjNOf2R+LU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-XPOQQCl4OLW6A5JXKc2XaQ-1; Mon, 15 Mar 2021 14:14:27 -0400
X-MC-Unique: XPOQQCl4OLW6A5JXKc2XaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BB77814313;
 Mon, 15 Mar 2021 18:14:26 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5675160C5F;
 Mon, 15 Mar 2021 18:14:26 +0000 (UTC)
Subject: Re: test failures for cross-i386-user
To: Claudio Fontana <cfontana@suse.de>
References: <4c8c6826-f32e-7793-9da9-9f3c71f8ab03@suse.de>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cd5a3671-7fcd-6d3c-cac0-b99f4164b3da@redhat.com>
Date: Mon, 15 Mar 2021 13:14:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4c8c6826-f32e-7793-9da9-9f3c71f8ab03@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 12:58 PM, Claudio Fontana wrote:
> Hello Eric,
> 
> I am seeing some test failures after todays' rebase on latest master for the "cross-i386-user", while on Friday it was ok:
> 
> https://gitlab.com/hw-claudio/qemu/-/jobs/1098390932
> 
> Running test test-cutils
> **
> ERROR:../tests/unit/test-cutils.c:2290:test_qemu_strtosz_metric: assertion failed (res == 12345000): (12344999 == 12345000)
> Running test test-shift128
> ERROR test-cutils - Bail out! ERROR:../tests/unit/test-cutils.c:2290:test_qemu_strtosz_metric: assertion failed (res == 12345000): (12344999 == 12345000)
> 
> 
> Are you seeing this also?

Known issue.
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05290.html


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



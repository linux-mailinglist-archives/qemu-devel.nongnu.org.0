Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB4031F993
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:52:16 +0100 (CET)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5GZ-0006gf-BK
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lD50i-0007yI-Le; Fri, 19 Feb 2021 07:35:55 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:35959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lD50f-0006Ny-Ph; Fri, 19 Feb 2021 07:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=JonN1NCS652XOiO8Xm86mXISF9cE2EBohtuScQOMD0M=; 
 b=gSTm7aODhguErVS4vlgF+v8e2Cmx/fbu6J9GT9nSSCEN7NnFr1MlNucnMqCK/x1HgL7vYSS/wYTXj3ScskY0jWsBPIoLgellzJQoxNcQh7TN7KHD9/q1MRWHJFBitzqIg6AUZaJy0wwEb8LFpxItjvAzAGikuUo6JDDWa6jt/LX5tjN45giisHKgNBN0Xo+48a3Q8ZvnhBIfK8R1W14l+E3DfXSOB68Hvl81LvouHySWTBUX6My72C8EaD7xP4loc22gM+SoUemCXvhIC+UIZB0ftmd9S0E8rit7+IDf1nIj2parwV0t9GQuDXW70HDIaSJJtkLbapxPJlTVXefm1Q==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lD50J-0005YA-Ig; Fri, 19 Feb 2021 13:35:27 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lD50J-0006Rp-8w; Fri, 19 Feb 2021 13:35:27 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH] iotests: Drop deprecated 'props' from object-add
In-Reply-To: <ff22d21d-ccd8-77e5-1b4c-786e3df79400@redhat.com>
References: <20210216171653.6543-1-berto@igalia.com>
 <ff22d21d-ccd8-77e5-1b4c-786e3df79400@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 19 Feb 2021 13:35:27 +0100
Message-ID: <w51sg5sqlps.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 19 Feb 2021 01:04:00 PM CET, Max Reitz <mreitz@redhat.com> wrote:
> Two Python syntax nit picks below.

>>       ret =3D vm.qmp('object-add', qom_type=3D'throttle-group', id=3D'tg=
',
>> -                 props=3D{'x-bps-read': 4096})
>> +                 x_bps_read =3D 4096)
>
> To stay consistent, I think there shouldn=E2=80=99t be spaces around '=3D=
' here.

Right, I didn't notice that.

>> @@ -103,10 +103,9 @@ def test_concurrent_finish(write_to_stream_node):
>>           vm.qmp_log('object-add',
>>                      qom_type=3D'throttle-group',
>>                      id=3D'tg',
>> -                   props=3D{
>> -                       'x-iops-write': 1,
>> -                       'x-iops-write-max': 1
>> -                   })
>> +                   x_iops_write=3D1,
>> +                   x_iops_write_max=3D1
>> +                   )
>
> This indentation looks weird to me now.  Unfortunately, flake8 finds
> this is the only correct indentation, so I have no reason to complain.
>
> Perhaps putting it on the preceding line would be better?

I'm fine either way, I can resend the patch with Kevin's suggestions.

Berto


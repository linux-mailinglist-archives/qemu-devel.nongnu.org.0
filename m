Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41809F4E3A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 15:37:13 +0100 (CET)
Received: from localhost ([::1]:55334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT5Nv-0001QL-Q1
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 09:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39249)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iT5JM-0005pg-UN
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 09:32:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iT5JL-0004Vm-SK
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 09:32:28 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:59963)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iT5JJ-0004Ld-PA; Fri, 08 Nov 2019 09:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=scet15vgK/HHYIPpTVBWXXU/CiTfLy+I94P429zgSZs=; 
 b=Tltz70q8HxHKkQoDIiDk5RvW2yE3wFd78QZNMsfdUt+SX2S/mv1rfxWjBFBpRyk8v3U6es0IdE+X+E0+TiDg4z2zDvPhIWNozglq6I64VjEyZdAhUTay9+VzHgK5OGdZGkiDwY0SvLS38PKxkyP5HS4xDQXrkNR4KM9CIGc9guiRjlIlyys9YG9CO/qb9wElBUKYChNeDgQEDIHzO0SpRWScqyI0FLM7lSwp1A8VjqJMChClkJvm8sZooT3JDTJXC4VqZPP4DsWux87dH1fqACUPQLq/IIKINkX4T8gUj2PLeYd+wO0EXRyXdQCG+ICNluZHB+yzuXH3QFBgjnDxzg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iT5JI-00040G-He; Fri, 08 Nov 2019 15:32:24 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iT5JI-00049G-Et; Fri, 08 Nov 2019 15:32:24 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH 2/2] iotests: Test multiple blockdev-snapshot calls
In-Reply-To: <20191108085312.27049-3-kwolf@redhat.com>
References: <20191108085312.27049-1-kwolf@redhat.com>
 <20191108085312.27049-3-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 08 Nov 2019 15:32:24 +0100
Message-ID: <w51lfsqsakn.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 08 Nov 2019 09:53:12 AM CET, Kevin Wolf wrote:
> +# Test large write to a qcow2 image

This doesn't belong here I guess :)

I wonder if this test could go in 245 instead.

Berto


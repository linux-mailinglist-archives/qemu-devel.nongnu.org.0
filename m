Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203D159213
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 15:39:14 +0100 (CET)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Wgz-0000VY-II
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 09:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1Wfz-0008Ds-Pg
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:38:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1Wfy-00005w-PR
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:38:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58575
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1Wfy-00005o-M1
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 09:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581431890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x88N6pPs6rHTY0pUy/rigwoxjDeK2oYyZ8TZlYQL7N0=;
 b=dFxGebt6NGXFX8wLRO71/B4QDNRHS313RaDtm8cDbavPSh/FqCRoDp4Bu1vbQSTxMIKNiN
 Mil4YzVr6CHAR7otF5dw5ePB7fqV5hXS5eAqs7fgkaS0UiHxv4Dvtz7ZeERQ5WyiN4Xl2d
 CSaMHUT11dwjvApqMajTX1ieaQGPYHo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-t1SCMvsdPQqjCQ9cmqunXg-1; Tue, 11 Feb 2020 09:37:52 -0500
Received: by mail-wm1-f72.google.com with SMTP id t17so1470546wmi.7
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 06:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x88N6pPs6rHTY0pUy/rigwoxjDeK2oYyZ8TZlYQL7N0=;
 b=rXbRw055P11RWa3dyzT2GPdzfpo9Hh82DbcbbOXPbqEXHroBwNWpQz74G079gYPTrB
 wh53cp0Xy2HEOX5J/2UbqgBkMuZe13xfhGNb8q57RBV9Nv3a5y6vSZ5fw89vsfM3s/zR
 fiDJK5YXFZuPNwg4Ke9sIYjJm7wWahiBXlDou5rZlVTlSvHdy8RP6j1N66YVjN+AmX1s
 64jwyn//ftWAEtuks24FyZJFaUsT2uACwoDT9HOaHhFBg5EU+G54/8oX5SFpTtWC4pvg
 CC7iH01H0IUUEQO3lIm91nTwilGZA+1ui7NHCuz1+4K68ttVSUXwtFjHfC51Su1niv3H
 qyNA==
X-Gm-Message-State: APjAAAUSC3rtjPupXkSZ1OEUJKWjzcVBnyrBfV3bAlIy7n/U68rYVbFw
 5iW+76o6J975eW+rSDc/2hNguYD2VYYJPGpAsFVDoSXUykuZ1w9s+x8wDciH8WroxIQKQT/U/+p
 Z1Bj8l8eL2RS/LFU=
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr5887631wmj.43.1581431871400; 
 Tue, 11 Feb 2020 06:37:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEgbcdclIJ5kYu8zqGuLAS+Cl4rRTl5j6kBFdVDyAPakQSWSuCOM0IpU+ihQfBdmgZE3yJug==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr5887616wmj.43.1581431871153; 
 Tue, 11 Feb 2020 06:37:51 -0800 (PST)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id z19sm3872848wmi.43.2020.02.11.06.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 06:37:50 -0800 (PST)
Subject: Re: [PATCH v1 0/2] Improve virtio_check_params test
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
References: <20200211142551.13072-1-dplotnikov@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1b7ccdc2-2e3e-32d2-c82b-fb1e6cddd998@redhat.com>
Date: Tue, 11 Feb 2020 15:37:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211142551.13072-1-dplotnikov@virtuozzo.com>
Content-Language: en-US
X-MC-Unique: t1SCMvsdPQqjCQ9cmqunXg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: cohuck@redhat.com, wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Denis,

On 2/11/20 3:25 PM, Denis Plotnikov wrote:
> * fixed failing on non-existed machine type removal
> * the test refactored to add more parameters to check
> 
> Gereral questions left:
>     How to restric test for using:
>     1. on a set of target OS-es
>     2. on a set target architectures
>    
> 
> Denis Plotnikov (2):
>    tests/acceptance/virtio_check_params: remove excluded machine types
>      carefully
>    tests/acceptance/virtio_check_params: prepare to check different
>      params
> 
>   tests/acceptance/virtio_check_params.py | 52 ++++++++++++++++---------
>   1 file changed, 33 insertions(+), 19 deletions(-)
> 

Have you noticed my other series suggested by Cornelia?

It runs your test on S390X and PPC:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg675092.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg675095.html



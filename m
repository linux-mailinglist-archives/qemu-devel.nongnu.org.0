Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E391E383AC0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:09:21 +0200 (CEST)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligk5-0001ia-01
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ligdS-0007wE-E3
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:02:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ligdQ-0001vp-9Z
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621270947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8BjJMTxMV9jQn70R5QP8Rx7/jJq+ogdTmrW93yC0byw=;
 b=C62psI1gy2a/uVD5edKiehDi4740y9+XItm+MStC//cgVQepEDVaV0zrRpFxnc08mmC6Mn
 dOsw+PBCvNn3vGs8DbbtEffuk2d7zK/NHzqkBJKsb/dhTrXxCyxmwl4xLhlQLMuda9sY/t
 a0MdIwYzzHih+BXhb2p2kgGJunXYLK0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-lE-p8CVbNU6CWTnszhgz2A-1; Mon, 17 May 2021 13:02:23 -0400
X-MC-Unique: lE-p8CVbNU6CWTnszhgz2A-1
Received: by mail-ej1-f70.google.com with SMTP id
 v10-20020a170906292ab02903d18e1be8f8so1284925ejd.13
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8BjJMTxMV9jQn70R5QP8Rx7/jJq+ogdTmrW93yC0byw=;
 b=XncZ+q0eeIRBDFVolTUJ5JFy2Mz1+c/2Sim2Q1aibF0lbXYR3eD2k9aQDADWnRgcAq
 kuaPTKcumU9Wq26w77meRqRXtyP5/lsWdwUkS5dXixWMWnvbe4tE3KkI/evO4ZzeCEeD
 14zb95gozhRSSQ9iuGfYu6gqeOtRNTUTNSsgu3P6TV4sDCKIp2GBzuw8pDKheNzfJqvk
 OOivREkrsKQxkR+uiEt2BhVatajkdo9JpBeMBR3OgP4YpN72IsO7dr2sVNsTk9PlsLmS
 DOhvNY4kopwO+2+2GKIHtQb6kQcaEKwE3YUEM0Y3yPQ6QDjXEEogHXz7QfLWmGmTpd5M
 Q4Wg==
X-Gm-Message-State: AOAM530lSE7YwmxaRJ7xBg2As0kaAjf2nw0T38O6NPskkf7aznGjmLPB
 jD0f3BsaNJAHDrV5s00vaqs3zD+JJDKklWce/gaLZk6sb1xywT+c0Xj9u6XctzdtpieK6BoyS14
 /KjXiwI+nTwIN9j8=
X-Received: by 2002:a17:906:1c04:: with SMTP id
 k4mr889084ejg.197.1621270942396; 
 Mon, 17 May 2021 10:02:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/UxXtRECkPteH+iuJtqT7VymKhPTwpBkjH9M648vFvhx0PkAD+QDyDLGBWeJ7vl+XAGD7XA==
X-Received: by 2002:a17:906:1c04:: with SMTP id
 k4mr889059ejg.197.1621270942179; 
 Mon, 17 May 2021 10:02:22 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 bw26sm8935407ejb.119.2021.05.17.10.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 10:02:21 -0700 (PDT)
Subject: Re: [PATCH 00/10] Python: delint iotests, machine.py and
 console_socket.py
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210512214642.2803189-1-jsnow@redhat.com>
 <c88b2878-fb79-7382-81c6-ea764d7f3ada@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <da44453e-09a7-3b0d-342f-7a128a1ecb7f@redhat.com>
Date: Mon, 17 May 2021 19:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c88b2878-fb79-7382-81c6-ea764d7f3ada@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/05/2021 18:11, John Snow wrote:
> On 5/12/21 5:46 PM, John Snow wrote:
>> gitlab CI: https://gitlab.com/jsnow/qemu/-/pipelines/301924893
>> branch: 
>> https://gitlab.com/jsnow/qemu/-/commits/python-package-pre-cleanup
>>
>> This series serves as a pre-requisite for packaging the python series
>> and getting the linters running via CI. The first patch fixes a linter
>> error we've had for a while now; the subsequent 9 fix a new warning that
>> was recently added to pylint 2.8.x.
>>
>> If there's nobody opposed, I'll take it through my Python queue,
>> including the iotests bits.
>>
>> John Snow (10):
>>    python/console_socket: avoid one-letter variable
>>    python/machine: use subprocess.DEVNULL instead of
>>      open(os.path.devnull)
>>    python/machine: use subprocess.run instead of subprocess.Popen
>>    python/console_socket: Add a pylint ignore
>>    python/machine: Disable pylint warning for open() in _pre_launch
>>    python/machine: disable warning for Popen in _launch()
>>    iotests: use subprocess.run where possible
>>    iotests: use 'with open()' where applicable
>>    iotests: silence spurious consider-using-with warnings
>>    iotests: ensure that QemuIoInteractive definitely closes
>>
>>   python/qemu/console_socket.py    | 11 ++++---
>>   python/qemu/machine.py           | 28 ++++++++++------
>>   tests/qemu-iotests/iotests.py    | 55 +++++++++++++++++++-------------
>>   tests/qemu-iotests/testrunner.py |  1 +
>>   4 files changed, 57 insertions(+), 38 deletions(-)
>>
> 
> The iotests stuff was handled by Emanuele Giuseppe Esposito instead, and 
> -- I must admit -- better than I did. Dropping patches 7-10.

Yes, patch 7-9 + the #pylint: disable= in patch 10 are covered in
"qemu-iotests: fix pylint 2.8 consider-using-with error"
https://patchew.org/QEMU/20210510190449.65948-1-eesposit@redhat.com/
that is merged.

Just wanted to point that maybe you want to keep part of patch 10, if 
you think that it is important :)

Emanuele



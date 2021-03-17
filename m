Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8040633EF62
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:21:05 +0100 (CET)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUEa-0004r5-Ii
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMUBt-0003LK-9T
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:18:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMUBr-0006Pp-BZ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:18:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615979893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0861bpymI7LLU7CzmeOAxRFt7DnELXFRXOBfFBarVY0=;
 b=apwlLh/Im2+yRQeXYpVJdX7vtEgKVbPdtJhPECbWLzScbAStBIMenHgdz8jL7mwS+26Fak
 8tQ5kKV5m/TmcBgQKEpBWk1LEGWCKr244ljDD/eaGjnvVVak2uIznMQa6/V0s/PO66qzdg
 Imk035Oib83V8OpIAVhheD5jKCBIWuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-GfFSejv7O7-OQcoVebSaRA-1; Wed, 17 Mar 2021 07:18:01 -0400
X-MC-Unique: GfFSejv7O7-OQcoVebSaRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D2EC108BD07;
 Wed, 17 Mar 2021 11:17:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8165E53E35;
 Wed, 17 Mar 2021 11:17:55 +0000 (UTC)
Subject: Re: [PULL 00/17] NBD patches through 2021-03-09
To: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>
References: <20210309155202.1312571-1-eblake@redhat.com>
 <CAFEAcA9dSR_yvsxERtFcC1BApWMH0vqqcn1d89bgW1S_9xmYPQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c6036170-b943-1a60-90b3-668ac1637d6d@redhat.com>
Date: Wed, 17 Mar 2021 12:17:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9dSR_yvsxERtFcC1BApWMH0vqqcn1d89bgW1S_9xmYPQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/2021 20.02, Peter Maydell wrote:
> On Tue, 9 Mar 2021 at 16:23, Eric Blake <eblake@redhat.com> wrote:
>>
>> The following changes since commit 0436c55edf6b357ff56e2a5bf688df8636f83456:
>>
>>    Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-08 13:51:41 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-03-09
>>
>> for you to fetch changes up to 1184b411016bce7590723170aa6b5984518707ec:
>>
>>    block/qcow2: refactor qcow2_update_options_prepare error paths (2021-03-08 16:04:46 -0600)
>>
>> ----------------------------------------------------------------
>> nbd patches for 2021-03-09
>>
>> - Add Vladimir as NBD co-maintainer
>> - Fix reporting of holes in NBD_CMD_BLOCK_STATUS
>> - Improve command-line parsing accuracy of large numbers (anything going
>> through qemu_strtosz), including the deprecation of hex+suffix
>> - Improve some error reporting in the block layer
>>
>> ----------------------------------------------------------------
> 
> This broke the gitlab cross-i386-user job:
> https://gitlab.com/qemu-project/qemu/-/jobs/1090685134
> 
> ERROR:../tests/test-cutils.c:2290:test_qemu_strtosz_metric: assertion
> failed (res == 12345000): (12344999 == 12345000)

A different failure shows up in the MSYS2 builds now, too:

https://cirrus-ci.com/task/5180846782021632?command=test#L543

  Thomas



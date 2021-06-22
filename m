Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768F73B05EC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:37:22 +0200 (CEST)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgaf-00017I-2G
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lvgYH-0006R9-Pu
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:34:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lvgYD-0003fv-Bg
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624368887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wynFZldeKVfVocCa9KNYO1RKW1lxqm3ZY4SWCsk7etY=;
 b=hrclmoK7PTybNGMvg7Wx+sbssm8C2Pkc3UsQmf1yoSgePLkIXC6QHnkigxRovVFek28i+t
 KLvpGjNmFtducN3wFKjbeu9YUazfu2kvtUvdVlgZk/FTU6i2P1lyGIaZzdMfX5OyePB3ka
 i8M8o/2iAZkdoWmVkyiy2rY/72Mof20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-TASkb6vGNHiTcMvntGIruw-1; Tue, 22 Jun 2021 09:34:44 -0400
X-MC-Unique: TASkb6vGNHiTcMvntGIruw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84545802E69;
 Tue, 22 Jun 2021 13:34:43 +0000 (UTC)
Received: from [10.10.118.71] (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E52E95D6AD;
 Tue, 22 Jun 2021 13:34:42 +0000 (UTC)
Subject: Re: [PULL 00/72] Python patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210618230455.2891199-1-jsnow@redhat.com>
 <CAFEAcA93aBaLhPLh3+5zKygSPY9XnuXMR3rJUVUJW-+W6VjrGQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <5df02204-fcba-f4f6-3c61-c6e1ee2eadab@redhat.com>
Date: Tue, 22 Jun 2021 09:34:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA93aBaLhPLh3+5zKygSPY9XnuXMR3rJUVUJW-+W6VjrGQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 3:42 PM, Peter Maydell wrote:
> On Sat, 19 Jun 2021 at 00:05, John Snow <jsnow@redhat.com> wrote:
>>
>> The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:
>>
>>    Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>>
>> for you to fetch changes up to d08caefe6648fc0713af5361e2b88bee53b67ebb:
>>
>>    scripts/qmp-shell: add redirection shim (2021-06-18 16:10:07 -0400)
>>
>> ----------------------------------------------------------------
>> Python Pull request
>>
>> Moves QMP-related tools not used for build or automatic testing from
>> scripts/ to python/qemu/qmp/ where they will be protected from bitrot by
>> the check-python-* CI jobs.
>>
>> stub forwarders are left in the old locations for now.
> 
> 
> Applied, thanks.
> 
> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
> for any user-visible changes.
> 
> -- PMM
> 

Great, thanks. No user-visible changes, but some developer-visible ones 
have happened with Python in 6.1. Should I summarize them somewhere?

--js



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC536B843
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 19:46:58 +0200 (CEST)
Received: from localhost ([::1]:49738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb5Jx-0004Op-Mh
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 13:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5Cm-0001WG-7h
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5Cg-0004Qm-Fw
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619458763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KxWlMUOMvZe36BPKoDfiOt7/Uyb99IifQEZcOo357A=;
 b=SvaYN4My3tu8dHehUCp2fMiviF43FFs2WREfyjDMLB8u2aOKtnkXZuClo5trIx18iRYceE
 A9Sa0RaQ1RxUn/xyr+3EF9SQpoaQJNh3Oj8HP48oxehKrf19QhOolIxu0PVRnshCMi4jgc
 Q0112r+fqWygICFmMKcwmac7rTTsC3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-lArVxFsnOsGiSFHK_7OwQw-1; Mon, 26 Apr 2021 13:39:21 -0400
X-MC-Unique: lArVxFsnOsGiSFHK_7OwQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB996343A6;
 Mon, 26 Apr 2021 17:39:20 +0000 (UTC)
Received: from [10.10.120.13] (ovpn-120-13.rdu2.redhat.com [10.10.120.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 575602C15B;
 Mon, 26 Apr 2021 17:39:20 +0000 (UTC)
Subject: Re: [PATCH 03/22] qapi/source: Remove line number from QAPISourceInfo
 initializer
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-4-jsnow@redhat.com>
 <87o8e49oha.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <2a5ae781-a32c-5d7e-c262-71496138f818@redhat.com>
Date: Mon, 26 Apr 2021 13:39:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87o8e49oha.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 2:38 AM, Markus Armbruster wrote:
> Not mentioned in the commit message: you add a default parameter value.
> It's not used; there's just one caller, and it passes a value.
> Intentional?
> 

No. Leftover from an earlier version where it was used. It can be made 
to always be an explicit parameter now instead.



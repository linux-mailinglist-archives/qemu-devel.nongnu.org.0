Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4744AF33
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:10:38 +0100 (CET)
Received: from localhost ([::1]:42878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkRpe-0004cZ-3t
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:10:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkRn9-00030q-MK
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:08:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkRn6-0006wn-0F
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636466879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GTeVYO43dfS8r/3dJznFjzzQoEbKlvjylJqlVDF5S40=;
 b=Q3K2SlZ9MKQV83/2jh1/Z9MYvwcZkNm0xgxMKRHucqlC5Sg8EKoO1ZV1ch0W61NKNfYYhw
 H+dqZh+7/4MQZTZePMdmES4cyE72007dYuCR8Zps2YpxrL4qhgDeWxg185v1KfjnWEh4DG
 PnjgCqw/RW3kgShXVmS+YMuH7QvvV8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-Kq6Uu4MGPr-N3RPKiiKQKw-1; Tue, 09 Nov 2021 09:07:56 -0500
X-MC-Unique: Kq6Uu4MGPr-N3RPKiiKQKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDD4DBAFA6;
 Tue,  9 Nov 2021 14:07:54 +0000 (UTC)
Received: from [10.39.194.213] (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8826417567;
 Tue,  9 Nov 2021 14:07:19 +0000 (UTC)
Message-ID: <0c924833-c3eb-4fc2-823b-6a0ece658533@redhat.com>
Date: Tue, 9 Nov 2021 15:07:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 22/22] python, iotests: replace qmp with aqmp
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211101173006.656673-1-jsnow@redhat.com>
 <20211101173006.656673-23-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211101173006.656673-23-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/2021 18.30, John Snow wrote:
> Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with the sync
> wrapper from qemu.aqmp instead.
> 
> Add an escape hatch in the form of the environment variable
> QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into using
> the old implementation, proving that both implementations work
> concurrently.

  Hi John,

seems like this patch broke our device-crash-test script. If I now run 
"scripts/device-crash-test -q" I get lots of error messages... could you 
please have a look?

  Thomas



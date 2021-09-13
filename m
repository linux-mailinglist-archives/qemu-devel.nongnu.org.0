Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D854088E0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:21:42 +0200 (CEST)
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPj5p-0000aY-5b
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPj3e-0007nk-44
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPj3a-0005Oh-JC
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631528360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQJ/ebFyahFHLPZbqBLNsO+SIv5iGLib1XwHPBTwL1Y=;
 b=DuEABqfp2HNsLeIHutdxyp8yu7Sc0QMauo5udYWEjNKQz+Se0yyPEmof/KdseDcBby9gRv
 2jyaxBP2rcMNp1OngK84aE8hXguIbznNOILr8+6vnMdmhX77w4zELwA0cyRw7wtnogI0O6
 Bfc/JX3IdeszHi8Qj7zLuSQvwH4XOa8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-zuKo5JfnO3mr782J9ofn5A-1; Mon, 13 Sep 2021 06:19:16 -0400
X-MC-Unique: zuKo5JfnO3mr782J9ofn5A-1
Received: by mail-wr1-f72.google.com with SMTP id
 g1-20020a5d64e1000000b0015e0b21ef04so578468wri.17
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 03:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wQJ/ebFyahFHLPZbqBLNsO+SIv5iGLib1XwHPBTwL1Y=;
 b=gDlZFu7e6vx7EiZiJyC/ZltspnBMvyPhh5eFWDr6Y9j0vitD2I+GANxFeP2r3CRyD2
 pt5F4TTIZvSggDyOMWz5XcH94Q4Onj1Pih/b/T56w0stcuqNo/BVX0HP6ik3785aBzAA
 QHqx3nu0XJgFqQSsnNC/qgl3Fj8pflXr6I6kP3HfexVqLCmtQJOJGNvLhK5Z2tz3Q3Tn
 XwtVROFgSekH0KVxLy132/yPzPl9jxOK2qzABV7J8PLYfVuxhxeeL5Ow4EKYi/HoSEpu
 JAHlxYMbpOhG+28yblKV0BSi9YWiisFBwdlTDbHj+DsADkBWdfghv9lyaf+WdLPdJGPj
 XJvQ==
X-Gm-Message-State: AOAM5331TYLHQCwthRNn97dsoRXJiy9mwqogzFgqs3NzzBM5dPJ9BQ0C
 D125g6j3fv7vLJy+yriZFddXUOGvEw+0Dr/lvzibQmibs8G34eBplDcUjE2DRE67YmiC4N+Bv+X
 seGgp61JsOYskC2Y=
X-Received: by 2002:a05:600c:350d:: with SMTP id
 h13mr10467019wmq.38.1631528355732; 
 Mon, 13 Sep 2021 03:19:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUYMhRSA0s/KIKz6MaXsz+8aGICP4tffv8zkQsh5Kja0N8JyiFtF4TBdAM1n2JcXzD7F/mEQ==
X-Received: by 2002:a05:600c:350d:: with SMTP id
 h13mr10466992wmq.38.1631528355457; 
 Mon, 13 Sep 2021 03:19:15 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j14sm7047580wrp.21.2021.09.13.03.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 03:19:15 -0700 (PDT)
Subject: Re: [PATCH RFC server v2 01/11] vfio-user: build library
To: John Levon <john.levon@nutanix.com>, "thuth@redhat.com"
 <thuth@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
 <16c06c73-3b1b-1178-805d-3dceab4d41de@redhat.com>
 <YT0t3gY7yR6lPUPL@movementarian.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b155f533-01c2-d141-f792-788c55135ed0@redhat.com>
Date: Mon, 13 Sep 2021 12:19:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YT0t3gY7yR6lPUPL@movementarian.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 12:29 AM, John Levon wrote:
> On Fri, Sep 10, 2021 at 05:20:09PM +0200, Philippe Mathieu-Daudé wrote:
>> On 8/27/21 7:53 PM, Jagannathan Raman wrote:
>>> add the libvfio-user library as a submodule. build it as a cmake
>>> subproject.
>>>
>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>>> ---
>>>  configure                | 11 +++++++++++
>>>  meson.build              | 28 ++++++++++++++++++++++++++++
>>>  .gitmodules              |  3 +++
>>>  MAINTAINERS              |  7 +++++++
>>>  hw/remote/meson.build    |  2 ++
>>>  subprojects/libvfio-user |  1 +
>>>  6 files changed, 52 insertions(+)
>>>  create mode 160000 subprojects/libvfio-user
>>
>>> diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
>>> new file mode 160000
>>> index 0000000..647c934
>>> --- /dev/null
>>> +++ b/subprojects/libvfio-user
>>> @@ -0,0 +1 @@
>>> +Subproject commit 647c9341d2e06266a710ddd075f69c95dd3b8446
>>
>> Could we point to a sha1 of a released tag instead?
> 
> We don't have releases (yet) partly because we haven't yet stabilized the API.

OK. Maybe acceptable, up to the maintainer then ¯\_(ツ)_/¯



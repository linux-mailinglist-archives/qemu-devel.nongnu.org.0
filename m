Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146FEBBED4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 01:10:02 +0200 (CEST)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCXSx-0004dz-Ck
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 19:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iCXJb-0005Y2-2v
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:00:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iCXJX-00081x-Mj
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:00:18 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41518)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iCXJX-00081D-B3
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:00:15 -0400
Received: by mail-wr1-x443.google.com with SMTP id h7so15724475wrw.8
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 16:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=nT3xBaCVZhKK+bbM2D8EcQqUQ4OfyQS+TZn4Ujy4sco=;
 b=yYk9Oyl+LLaS4s8kIinyrdZYHrqkfFQs3CxSszgAi/WEwB5voqhQ9fLr8pjuo8Kdum
 owiLiMRkxSWBo4va7yptPf0JyafbMMiG0xPRo4nCYmF4w/DkhMvMJJ/6kbicS//ogzm+
 xlPYY6Ze4sPHgRh8t2QrZt7rL+sJ+IoNwcUwCViOQu0Vo4ouSOPbrGQ03QRwhVklqxP6
 9J+LytGsmd1qQOPi11cz40YYBnO6TNQBUf4ZOJWRpGzfUGh1Kibp8/Y+Tp66MNERHmzD
 UZcufdHyto0dJS5+chOLMSVeG33hGpaBjnxO2dAN+H84wvP+2ojrslltYaNo+RCIQ7T2
 Yy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=nT3xBaCVZhKK+bbM2D8EcQqUQ4OfyQS+TZn4Ujy4sco=;
 b=Qv8jb9Ptwa1VpwPyQAwSxtGeGfVxUJc9qFWNHcSbr9tbUTxF6UoJET6Ctltkb6738E
 UcFWND/mpb8vZyLkE/EA2brYhHm3mMa7uRTDHNqR824lF0+IAUN6U/GrfcJFRg1p8zGn
 IIP7ZgCdandmGD1HdzsY5WmFrV4pmEfCPxtL+GYyflzJ+Obxia4V/aTMVBBsF2amFy47
 EsaUc2/nr1P4pBKvFCIYzTe/VlqaBQ+LfWvLu5kpdufEaj/C1oO+WoBwtg836gtWyqwZ
 GE7Kx9ZTOt0ouugbYTn22Mdl6ywmlFurPeVLVtI3PFmt7NSkjKZefiLYKHa632D49KHO
 ProA==
X-Gm-Message-State: APjAAAWJhEadbj7ZLm+4bz6L4pMVZuNLDX067hL8pWFzocv7XAOo5X1P
 czbt+NymLljV0a8g3gJD+8+K+g==
X-Google-Smtp-Source: APXvYqz7iGbh/fFrwp9cjYdOFbH4GXZkzIIjTkVnCvClIvvCDgFyWBhNRKqmqjGmNItNxe8oxPL+7g==
X-Received: by 2002:a05:6000:1002:: with SMTP id
 a2mr1166588wrx.272.1569279613923; 
 Mon, 23 Sep 2019 16:00:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o19sm16812013wro.50.2019.09.23.16.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 16:00:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 802911FF87;
 Tue, 24 Sep 2019 00:00:12 +0100 (BST)
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-5-alex.bennee@linaro.org>
 <20190923205115.GE6528@dhcp-17-179.bos.redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 04/16] tests/docker: reduce scary warnings from
 failed inspect
In-reply-to: <20190923205115.GE6528@dhcp-17-179.bos.redhat.com>
Date: Tue, 24 Sep 2019 00:00:12 +0100
Message-ID: <87h852boub.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Philippe =?utf-8?Q?Mathieu?= =?utf-8?Q?-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> On Thu, Sep 19, 2019 at 06:10:03PM +0100, Alex Benn=C3=A9e wrote:
>> There is a race here in the clean-up code so lets just accept that
>> sometimes the active task we just looked up might have finished before
>> we got to inspect it.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/docker/docker.py | 32 ++++++++++++++++++--------------
>>  1 file changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
>> index 29613afd489..4dca6006d2f 100755
>> --- a/tests/docker/docker.py
>> +++ b/tests/docker/docker.py
>> @@ -235,20 +235,24 @@ class Docker(object):
>>          if not only_active:
>>              cmd.append("-a")
>>          for i in self._output(cmd).split():
>> -            resp =3D self._output(["inspect", i])
>> -            labels =3D json.loads(resp)[0]["Config"]["Labels"]
>> -            active =3D json.loads(resp)[0]["State"]["Running"]
>> -            if not labels:
>> -                continue
>> -            instance_uuid =3D labels.get("com.qemu.instance.uuid", None)
>> -            if not instance_uuid:
>> -                continue
>> -            if only_known and instance_uuid not in self._instances:
>> -                continue
>> -            print("Terminating", i)
>> -            if active:
>> -                self._do(["kill", i])
>> -            self._do(["rm", i])
>> +            try:
>> +                resp =3D self._output(["inspect", i])
>> +                labels =3D json.loads(resp)[0]["Config"]["Labels"]
>> +                active =3D json.loads(resp)[0]["State"]["Running"]
>> +                if not labels:
>> +                    continue
>> +                instance_uuid =3D labels.get("com.qemu.instance.uuid", =
None)
>> +                if not instance_uuid:
>> +                    continue
>> +                if only_known and instance_uuid not in self._instances:
>> +                    continue
>> +                print("Terminating", i)
>> +                if active:
>> +                    self._do(["kill", i])
>> +                    self._do(["rm", i])
>
> Both podman and docker seem to handle "rm -f $INSTANCE" well, which
> would by itself consolidate the two commands in one and minimize the
> race condition.

It's the self.__output which is the real race condition because
check_output complains if the command doesn't succeed with 0. What we
really need is to find somewhat of filtering the ps just for qemu
instances and then just rm -f them as you suggest.

>
> For unexisting containers, and no other errors, podman will return "1
> if one of the specified containers did not exist, and no other
> failure", as per its man page.  I couldn't find any guarantee that
> docker will also return 1 on a similar situation, but that's what
> I've experienced too:
>
>  $ docker rm -f CONTAINER_IS_NOW_FONE
>  Error response from daemon: No such container: CONTAINER_IS_NOW_GONE
>  $ echo $?
>  1
>
> Maybe waiving exit status 1 and nothing else would do the trick here
> and not hide other real problems?
>
> - Cleber.
>
>> +            except subprocess.CalledProcessError:
>> +                # i likely finished running before we got here
>> +                pass
>>
>>      def clean(self):
>>          self._do_kill_instances(False, False)
>> --
>> 2.20.1
>>
>>


--
Alex Benn=C3=A9e


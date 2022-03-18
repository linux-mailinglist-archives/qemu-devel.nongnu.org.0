Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E440B4DE420
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 23:41:31 +0100 (CET)
Received: from localhost ([::1]:45666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVLHn-0005xI-1F
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 18:41:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVLGg-00054O-Sa
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 18:40:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVLGe-0007VZ-B1
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 18:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647643219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3MqRjipwuYzU3cQnA5URe0EKzxChCPKujZ/iR8XtkM=;
 b=Ckm0XtE/OlZmZFtB5oKtkcvGpc2ZkP7NpZYPSZzwktn2sjVN7EeYqWwZuZMQtNBNvz73m/
 sjryHJVajiFfsv9C0dB2yUmY2b4fwU+HQQwUgvOtEf8k+MRHK55RLfZbVsOOjAdKs8EgGa
 6EfRS/XtI/ntBj2J+ujjLwx1/N7QBKg=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-RHBp873PPH-B_hJuQftoxQ-1; Fri, 18 Mar 2022 18:40:18 -0400
X-MC-Unique: RHBp873PPH-B_hJuQftoxQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 z1-20020ab05641000000b00341f2a589deso4433654uaa.7
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 15:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G3MqRjipwuYzU3cQnA5URe0EKzxChCPKujZ/iR8XtkM=;
 b=fQbggSLRJToHZZUUO3Mzasxd2nYNsw9Lq84iKfo1tZz7B4SrcZBZCCuftOPVvFQVYK
 NWkFh4icJyVjOKLIbRHBsxpEftcqeEhe3IBtlui2Iro62jhWewvUO9lhSA+dZ0ekvLPt
 9fqXp/C4zIjBfYmpr3c0SHcw1xONzuLimy6D9/Eou7o7DWydofV7OM9xhZ5JtaIxKcII
 ZmdmFmzaHify69wijoa1gHUrM/8H5nQr+Ptvz4sP/WjMIl862+zNIXaLqMK03eDsk/Ok
 bYuVGx8ic/xnm1b0g+9CgYZVcFF4P2DvVmKbgMToq4Poozrhpn27QNkzlg1SXazVYVI4
 AxEA==
X-Gm-Message-State: AOAM5304n0cJSxX0f59hummkqAVQp16sQ1psM8UxO1YRI44aYKWjojAy
 wlbBeEa2SwLAkXRFsWq0fYFkp7b+WNEZ1EYdssCwpIgjWWAXowggAi2XClJwWbGQkJb1AhHFHax
 XysLARhlhrWyhqn3bgP6/lfEzzVd/MOk=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr4785035vkf.35.1647643217705; 
 Fri, 18 Mar 2022 15:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpO5vvVvlpQmD7igt+cowkYq5RdFqCj315ILSFmaiqqCHmhS7iOTwtl24jdiZlryDc0aAFgIVbK0gizDNDh6s=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr4785030vkf.35.1647643217348; Fri, 18 Mar
 2022 15:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220318125304.66131-1-hreitz@redhat.com>
 <20220318125304.66131-3-hreitz@redhat.com>
In-Reply-To: <20220318125304.66131-3-hreitz@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 18 Mar 2022 18:40:06 -0400
Message-ID: <CAFn=p-ZchBuVyvBVqVxbERTz-_J+vBYBNZk5fo=XRekfhsv=Pw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iotests/207: Filter host fingerprint
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 8:53 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> Commit e3296cc796aeaf319f3ed4e064ec309baf5e4da4 made the ssh block
> driver's error message for fingerprint mismatches more verbose, so it
> now prints the actual host key fingerprint and the key type.
>
> iotest 207 tests such errors, but was not amended to filter that
> fingerprint (which is host-specific), so do it now.  Filter the key
> type, too, because I guess this too can differ depending on the host
> configuration.
>

Oh, neat.

(Not that neat.)

> Fixes: e3296cc796aeaf319f3ed4e064ec309baf5e4da4
>        ("block: print the server key type and fingerprint on failure")
> Reported-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/207     | 7 ++++++-
>  tests/qemu-iotests/207.out | 6 +++---
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qemu-iotests/207 b/tests/qemu-iotests/207
> index 0f5c4bc8a0..41dcf3ff55 100755
> --- a/tests/qemu-iotests/207
> +++ b/tests/qemu-iotests/207
> @@ -35,7 +35,12 @@ def filter_hash(qmsg):
>          if key =3D=3D 'hash' and re.match('[0-9a-f]+', value):
>              return 'HASH'
>          return value
> -    return iotests.filter_qmp(qmsg, _filter)
> +    if isinstance(qmsg, str):
> +        # Strip key type and fingerprint
> +        p =3D r"\S+ (key fingerprint) '(md5|sha1|sha256):[0-9a-f]+'"
> +        return re.sub(p, r"\1 '\2:HASH'", qmsg)
> +    else:
> +        return iotests.filter_qmp(qmsg, _filter)
>
>  def blockdev_create(vm, options):
>      vm.blockdev_create(options, filters=3D[iotests.filter_qmp_testfiles,=
 filter_hash])
> diff --git a/tests/qemu-iotests/207.out b/tests/qemu-iotests/207.out
> index aeb8569d77..05cf753283 100644
> --- a/tests/qemu-iotests/207.out
> +++ b/tests/qemu-iotests/207.out
> @@ -42,7 +42,7 @@ virtual size: 4 MiB (4194304 bytes)
>
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options"=
: {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode"=
: "hash", "type": "md5"}, "path": "TEST_DIR/PID-t.img", "server": {"host": =
"127.0.0.1", "port": "22"}}, "size": 2097152}}}
>  {"return": {}}
> -Job failed: remote host key does not match host_key_check 'wrong'
> +Job failed: remote host key fingerprint 'md5:HASH' does not match host_k=
ey_check 'md5:wrong'
>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>  {"return": {}}
>
> @@ -59,7 +59,7 @@ virtual size: 8 MiB (8388608 bytes)
>
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options"=
: {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode"=
: "hash", "type": "sha1"}, "path": "TEST_DIR/PID-t.img", "server": {"host":=
 "127.0.0.1", "port": "22"}}, "size": 2097152}}}
>  {"return": {}}
> -Job failed: remote host key does not match host_key_check 'wrong'
> +Job failed: remote host key fingerprint 'sha1:HASH' does not match host_=
key_check 'sha1:wrong'
>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>  {"return": {}}
>
> @@ -76,7 +76,7 @@ virtual size: 4 MiB (4194304 bytes)
>
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options"=
: {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode"=
: "hash", "type": "sha256"}, "path": "TEST_DIR/PID-t.img", "server": {"host=
": "127.0.0.1", "port": "22"}}, "size": 2097152}}}
>  {"return": {}}
> -Job failed: remote host key does not match host_key_check 'wrong'
> +Job failed: remote host key fingerprint 'sha256:HASH' does not match hos=
t_key_check 'sha256:wrong'
>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>  {"return": {}}
>
> --
> 2.35.1
>

sankyuu~

Reviewed-by: John Snow <jsnow@redhat.com>



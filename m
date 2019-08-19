Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95F921EB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 13:15:49 +0200 (CEST)
Received: from localhost ([::1]:48050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzfdc-0002gn-Iz
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 07:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hzfcH-0001ry-SU
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:14:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hzfcC-0008Hs-US
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:14:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36650)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hzfcC-0008HG-N1
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:14:20 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C7A617E42A
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 11:14:19 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id n13so206639wmi.4
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 04:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zSoV2oG1DdX2mO8cRKnaIKjPzmJbp8I9vsfmqSbyQlc=;
 b=oMkvUwFAfuq8iOSqumUh5aj0pSGe0Vh7nSeRVYeknq5wdgg/Frkqipkd89GWOIzg/a
 HrVK/bi2FZruvfCCTUTJ0S4ov/rdxEIH/JAYvFdem6DIenFCpPQeYdqPspHib+dsy9+n
 szjnvSl5uuChdzRDulnhQD5uG0DNUua4ADCzI0QCcDsIeOOWNn9PG1wwd96P6gHasMfe
 ztcb0/4pDfgx1X0zMNoOQpvZ0O6awp5NNZmXpFLYwdGPgxYzkUBwx7KLRVkDlYfiquQ/
 jSsqDaYMMiIsvBkJ096zCMYh2gk6Y69+Hn2nW9ZEdYhzBHyWNYZ2eel4BMmFsLEioU0a
 iC3A==
X-Gm-Message-State: APjAAAXPMmpNwaW9YzhIZ/s5A2zX75u7H1QakSsycaUAxoo2cLlUoEo/
 2OCZapYVWDedPKTKjYZbBw1V8XWsPBaF+dK94LZX9VW3nZAmEVYuv5rQcaD3wiHe8UG7x+/ellE
 K4DuWezSMkRByMiU=
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr7828689wmj.58.1566213258514;
 Mon, 19 Aug 2019 04:14:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHJxg9yDFMtuo7pnO6X6tEQhaAPueUMzEqpxvNr3X2SIhfH2QTPzkWp/tFA8uANfYBE30rLg==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr7828673wmj.58.1566213258347;
 Mon, 19 Aug 2019 04:14:18 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id a19sm47692823wra.2.2019.08.19.04.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 04:14:17 -0700 (PDT)
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20190814020218.1868-1-quintela@redhat.com>
 <20190814020218.1868-2-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <781c9a06-3488-a308-cc80-99adb115402b@redhat.com>
Date: Mon, 19 Aug 2019 13:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190814020218.1868-2-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/6] migration: Add traces for multifd
 terminate threads
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/14/19 4:02 AM, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c        | 4 ++++
>  migration/trace-events | 2 ++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index 889148dd84..ca11d43e30 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -996,6 +996,8 @@ static void multifd_send_terminate_threads(Error *e=
rr)
>  {
>      int i;
> =20
> +    trace_multifd_send_terminate_threads(err !=3D NULL);
> +
>      if (err) {
>          MigrationState *s =3D migrate_get_current();
>          migrate_set_error(s, err);
> @@ -1254,6 +1256,8 @@ static void multifd_recv_terminate_threads(Error =
*err)
>  {
>      int i;
> =20
> +    trace_multifd_recv_terminate_threads(err !=3D NULL);
> +
>      if (err) {
>          MigrationState *s =3D migrate_get_current();
>          migrate_set_error(s, err);
> diff --git a/migration/trace-events b/migration/trace-events
> index d8e54c367a..886ce70ca0 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -85,12 +85,14 @@ multifd_recv(uint8_t id, uint64_t packet_num, uint3=
2_t used, uint32_t flags, uin
>  multifd_recv_sync_main(long packet_num) "packet num %ld"
>  multifd_recv_sync_main_signal(uint8_t id) "channel %d"
>  multifd_recv_sync_main_wait(uint8_t id) "channel %d"
> +multifd_recv_terminate_threads(bool error) "error %d"
>  multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) =
"channel %d packets %" PRIu64 " pages %" PRIu64
>  multifd_recv_thread_start(uint8_t id) "%d"
>  multifd_send(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t =
flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " page=
s %d flags 0x%x next packet size %d"
>  multifd_send_sync_main(long packet_num) "packet num %ld"
>  multifd_send_sync_main_signal(uint8_t id) "channel %d"
>  multifd_send_sync_main_wait(uint8_t id) "channel %d"
> +multifd_send_terminate_threads(bool error) "error %d"
>  multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t pages) =
"channel %d packets %" PRIu64 " pages %"  PRIu64
>  multifd_send_thread_start(uint8_t id) "%d"
>  ram_discard_range(const char *rbname, uint64_t start, size_t len) "%s:=
 start: %" PRIx64 " %zx"

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>



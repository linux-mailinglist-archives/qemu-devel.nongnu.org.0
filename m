Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BCA38938C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:22:51 +0200 (CEST)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOyA-0005Cf-JN
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ljOtp-0001Hn-Pz
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:18:25 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ljOtY-0000Ug-NE
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:18:09 -0400
Received: by mail-ed1-x534.google.com with SMTP id di13so16045298edb.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 09:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qubzM1Uz7bMxcFbCA4z/GVK+B8x/+mWNkuA7zTDE4zE=;
 b=Zu0DYJDimZdWK5Fjp5F/NyuH9V1saD1uyUUi+TxdxIB6gVa+ShlKp6hSRsqBbk5Gz3
 /oWAqLy9rT1f5gEcJY2mCEjxrF/Rfxu5FGUJdKJKzvjnz3URDwpNah87tVY0fuMINnUl
 ErFcsPxVcUGoFb+HrKLr9YXgVXOBP1LdXQoqdSU1xxEkMjHyYRPHsFQcDwlpwx639Tj2
 1edpCZhKlgfdeXgvjGLfS+xOqciqMxfJ/gk4q6iXvDFmX05C/7+vzm6kfBB8RS986XMj
 COCQuQKB2+A8YWQmqcBu/nWa2USqiszKUqfSl8XzVNO+sB2rlix82ocCiKq2ihMjM5Jx
 fCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qubzM1Uz7bMxcFbCA4z/GVK+B8x/+mWNkuA7zTDE4zE=;
 b=tl15LxwQ4dvDsElPBz7s/934n3N1vf4IVrfJeQPPV9Zet0KhDBSqzNkl82/wsE1G/W
 RsISUg1HRNIcIyxg8pXoB0w28MxudcStj9Rf2znk/V29jIagpQfC4rMda7qyC4pbRRGn
 kDJ3yLlAPocU/OAdHUpgbMhJJGhGvndBNhs2M01LiHDLoLu2L+N0j4heDPmFrrVdmoAy
 53olQaIh2UuQIC0wv2JFGZdr0W2vpCvBEtDDFAzg6e5WLGgCx49DDGwgIoP7QAmdkxmN
 ngKTeK8TC8GT7pb9bgtuHFNQ33r51mK1EcUbABqtHsJ0eIe5dNVROQ/qOqD196iVl3o0
 4/Ug==
X-Gm-Message-State: AOAM530rrMaAt8KIwtwmDi5qjVeTFg9EDwF18ze6QYwv+4vyIX+uTin0
 kCgkRsn31gNIvxIky+4T7k3C1Q41p/IH8iQQhWc=
X-Google-Smtp-Source: ABdhPJwO0QCzUQl3g+E2y5jmoRvFcrGSgyIzAvCq2PpEeNarqHVvL5UgNW0Zw2hQiWyOK17FZ6FNkQSrAqP1grM1JmY=
X-Received: by 2002:a50:c352:: with SMTP id q18mr15945115edb.30.1621441083188; 
 Wed, 19 May 2021 09:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
In-Reply-To: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 19 May 2021 20:17:51 +0400
Message-ID: <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
Subject: Re: A bug of Monitor Chardev ?
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c9aa1105c2b12b97"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: chenjiashang@huawei.com, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c9aa1105c2b12b97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, May 17, 2021 at 11:11 AM Longpeng (Mike, Cloud Infrastructure
Service Product Dept.) <longpeng2@huawei.com> wrote:

> We find a race during QEMU starting, which would case the QEMU process
> coredump.
>
> <main loop>                             |    <MON iothread>
>                                         |
> [1] create MON chardev                  |
> qemu_create_early_backends              |
>   chardev_init_func                     |
>                                         |
> [2] create MON iothread                 |
> qemu_create_late_backends               |
>   mon_init_func                         |
>         aio_bh_schedule----------------------->
> monitor_qmp_setup_handlers_bh
> [3] enter main loog                     |    tcp_chr_update_read_handler
> (* A client come in, e.g. Libvirt *)    |      update_ioc_handlers
>
tcp_chr_new_client                      |
>   update_ioc_handlers                   |
>                                         |
>     [4] create new hup_source           |
>         s->hup_source =3D *PTR1*          |
>           g_source_attach(s->hup_source)|
>                                         |        [5]
> remove_hup_source(*PTR1*)
>                                         |            (create new
> hup_source)
>                                         |             s->hup_source =3D
> *PTR2*
>         [6] g_source_attach_unlocked    |
>               *PTR1* is freed by [5]    |
>
> Do you have any suggestion to fix this bug ? Thanks!
>
>
I see.. I think the simplest would be for the chardev to not be dispatched
in the original thread after monitor_init_qmp(). It looks like this should
translate at least to calling qio_net_listener_set_client_func_full() with
NULL handlers. I can't see where we could fit that in the chardev API.
Perhaps add a new qemu_chr_be_disable_handlers() (until
update_read_handlers is called again to enable them)?

Daniel? Paolo?


--=20
Marc-Andr=C3=A9 Lureau

--000000000000c9aa1105c2b12b97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaTxicj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVv
dGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIE1heSAxNywgMjAy
MSBhdCAxMToxMSBBTSBMb25ncGVuZyAoTWlrZSwgQ2xvdWQgSW5mcmFzdHJ1Y3R1cmUgU2Vydmlj
ZSBQcm9kdWN0IERlcHQuKSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxvbmdwZW5nMkBodWF3ZWkuY29t
Ij5sb25ncGVuZzJAaHVhd2VpLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9y
ZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+V2Ug
ZmluZCBhIHJhY2UgZHVyaW5nIFFFTVUgc3RhcnRpbmcsIHdoaWNoIHdvdWxkIGNhc2UgdGhlIFFF
TVUgcHJvY2VzcyBjb3JlZHVtcC48YnI+DQo8YnI+DQombHQ7bWFpbiBsb29wJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgICZsdDtNT04gaW90aHJl
YWQmZ3Q7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfDxicj4NClsxXSBjcmVhdGUgTU9OIGNoYXJkZXbCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB8PGJyPg0KcWVtdV9jcmVhdGVfZWFybHlfYmFja2VuZHPCoCDCoCDCoCDC
oCDCoCDCoCDCoCB8PGJyPg0KwqAgY2hhcmRldl9pbml0X2Z1bmPCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8PGJyPg0KWzJdIGNyZWF0ZSBNT04gaW90aHJlYWTCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQpxZW11X2NyZWF0ZV9sYXRlX2JhY2tlbmRzwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KwqAgbW9uX2luaXRfZnVuY8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfDxicj4NCsKgIMKgIMKgIMKgIGFpb19iaF9zY2hlZHVs
ZS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tJmd0OyBtb25pdG9yX3FtcF9zZXR1cF9oYW5kbGVyc19i
aDxicj4NClszXSBlbnRlciBtYWluIGxvb2fCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHzCoCDCoCB0Y3BfY2hyX3VwZGF0ZV9yZWFkX2hhbmRsZXI8YnI+DQooKiBBIGNsaWVudCBjb21l
IGluLCBlLmcuIExpYnZpcnQgKinCoCDCoCB8wqAgwqAgwqAgdXBkYXRlX2lvY19oYW5kbGVycyA8
YnI+PC9ibG9ja3F1b3RlPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCnRjcF9jaHJfbmV3X2NsaWVudMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHw8YnI+DQrCoCB1cGRhdGVfaW9jX2hhbmRsZXJzwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB8PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfDxicj4NCsKgIMKgIFs0XSBjcmVhdGUgbmV3
IGh1cF9zb3VyY2XCoCDCoCDCoCDCoCDCoCDCoHw8YnI+DQrCoCDCoCDCoCDCoCBzLSZndDtodXBf
c291cmNlID0gKlBUUjEqwqAgwqAgwqAgwqAgwqAgfDxicj4NCsKgIMKgIMKgIMKgIMKgIGdfc291
cmNlX2F0dGFjaChzLSZndDtodXBfc291cmNlKXw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgWzVdIHJl
bW92ZV9odXBfc291cmNlKCpQVFIxKik8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgKGNyZWF0
ZSBuZXcgaHVwX3NvdXJjZSk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqBzLSZndDtodXBf
c291cmNlID0gKlBUUjIqPGJyPg0KwqAgwqAgwqAgwqAgWzZdIGdfc291cmNlX2F0dGFjaF91bmxv
Y2tlZMKgIMKgIHw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCAqUFRSMSogaXMgZnJlZWQgYnkg
WzVdwqAgwqAgfDxicj4NCjxicj4NCkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIHRvIGZpeCB0
aGlzIGJ1ZyA/IFRoYW5rcyE8YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIGNsZWFy
PSJhbGwiPjxkaXY+SSBzZWUuLiBJIHRoaW5rIHRoZSBzaW1wbGVzdCB3b3VsZCBiZSBmb3IgdGhl
IGNoYXJkZXYgdG8gbm90IGJlIGRpc3BhdGNoZWQgaW4gdGhlIG9yaWdpbmFsIHRocmVhZCBhZnRl
ciBtb25pdG9yX2luaXRfcW1wKCkuIEl0IGxvb2tzIGxpa2UgdGhpcyBzaG91bGQgdHJhbnNsYXRl
IGF0IGxlYXN0IHRvIGNhbGxpbmcgcWlvX25ldF9saXN0ZW5lcl9zZXRfY2xpZW50X2Z1bmNfZnVs
bCgpIHdpdGggTlVMTCBoYW5kbGVycy4gSSBjYW4mIzM5O3Qgc2VlIHdoZXJlIHdlIGNvdWxkIGZp
dCB0aGF0IGluIHRoZSBjaGFyZGV2IEFQSS4gUGVyaGFwcyBhZGQgYSBuZXcgcWVtdV9jaHJfYmVf
ZGlzYWJsZV9oYW5kbGVycygpICh1bnRpbCB1cGRhdGVfcmVhZF9oYW5kbGVycyBpcyBjYWxsZWQg
YWdhaW4gdG8gZW5hYmxlIHRoZW0pPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+RGFuaWVsPyBQ
YW9sbz88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+LS0gPGJyPjxkaXYg
ZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiPk1hcmMtQW5kcsOpIEx1cmVhdTxicj48
L2Rpdj48L2Rpdj4NCg==
--000000000000c9aa1105c2b12b97--


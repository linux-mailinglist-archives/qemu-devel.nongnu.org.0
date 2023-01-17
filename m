Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67EF66DB5C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:43:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjPT-0001dn-EU; Tue, 17 Jan 2023 05:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHjPO-0001dZ-96
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:41:38 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHjPJ-0005zg-JA
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2L/vUYxN/mhPKbivDb+PlE+UlZFDHIE0wb5IEeRlLYE=; b=c5TXXPvZRRmHBVlXHWtK2CTQ9a
 1DIdM9ZABLGtKE18x0H/D7gVnS6mx/RDDa6Qc0sD/22wOWSiSqEL/MKJimHSsOwlvzHOPVJWv/R6t
 IwqUUlKx3xfwGYvGPbGV1PIQ/9FVzO6dbXoqeB1lviYd9DQ/vCTItofioDvtPGNciWw7T0jpro6io
 TKpKsMAJUrZrzXQt96wsO8646ZgmaB9rVfg1oo6vFFWhRA2AB841ca7hulW+BU74DPt5f6mdEcue2
 sKMCrn4fIfUMnPLEqH+mlf/PSpn5wupX/veAGJ0TzoEfTWNI46tIZLWRsTFoQF7vogH6WLIHmjZWY
 tVU/5KKw==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHjPP-009bVo-1C; Tue, 17 Jan 2023 10:41:39 +0000
Message-ID: <56a381e7512c4344dc19c30695f1b6cbf588a611.camel@infradead.org>
Subject: Re: [PATCH v7 38/51] i386/xen: add monitor commands to test event
 injection
From: David Woodhouse <dwmw2@infradead.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant
 <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>, Ankur Arora
 <ankur.a.arora@oracle.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Date: Tue, 17 Jan 2023 10:41:23 +0000
In-Reply-To: <87mt6h4gnd.fsf@pond.sub.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-39-dwmw2@infradead.org>
 <87mt6h4gnd.fsf@pond.sub.org>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-VtRI2scLRVOTkAG0y6KV"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--=-VtRI2scLRVOTkAG0y6KV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus, thanks for the review.

On Tue, 2023-01-17 at 11:08 +0100, Markus Armbrster wrote:
> David Woodhouse <dwmw2@infradead.org> writes:
> > @@ -1059,3 +1063,137 @@ int xen_evtchn_send_op(struct evtchn_send *send=
)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > =C2=A0}
> > =C2=A0
> > +static const char *type_names[] =3D {
> > +=C2=A0=C2=A0=C2=A0 "closed",
> > +=C2=A0=C2=A0=C2=A0 "unbound",
> > +=C2=A0=C2=A0=C2=A0 "interdomain",
> > +=C2=A0=C2=A0=C2=A0 "pirq",
> > +=C2=A0=C2=A0=C2=A0 "virq",
> > +=C2=A0=C2=A0=C2=A0 "ipi"
> > +};
> > +
> > +EvtchnInfoList *qmp_xen_event_list(Error **errp)
> > +{
> > +=C2=A0=C2=A0=C2=A0 XenEvtchnState *s =3D xen_evtchn_singleton;
> > +=C2=A0=C2=A0=C2=A0 EvtchnInfoList *head =3D NULL, **tail =3D &head;
> > +=C2=A0=C2=A0=C2=A0 void *shinfo, *pending, *mask;
> > +=C2=A0=C2=A0=C2=A0 int i;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (!s) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Xen event=
 channel emulation not enabled");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 shinfo =3D xen_overlay_get_shinfo_ptr();
> > +=C2=A0=C2=A0=C2=A0 if (!shinfo) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Xen share=
d info page not allocated");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > +=C2=A0=C2=A0=C2=A0 }
>=20
> Suggest a blank line here.

Ack.


> > +=C2=A0=C2=A0=C2=A0 if (xen_is_long_mode()) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pending =3D shinfo + offset=
of(struct shared_info, evtchn_pending);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mask =3D shinfo + offsetof(=
struct shared_info, evtchn_mask);
> > +=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pending =3D shinfo + offset=
of(struct compat_shared_info, evtchn_pending);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mask =3D shinfo + offsetof(=
struct compat_shared_info, evtchn_mask);
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 QEMU_LOCK_GUARD(&s->port_lock);
> > +
> > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < s->nr_ports; i++) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XenEvtchnPort *p =3D &s->po=
rt_table[i];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EvtchnInfo *info;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p->type =3D=3D EVTCHNST=
AT_closed) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info =3D g_new0(EvtchnInfo,=
 1);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->port =3D i;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->type =3D g_strdup(typ=
e_names[p->type]);
>=20
> What ensures p->type is in bounds?

Because it's an internal data structure and it's never set to anything
else.

I did ponder a defensive 'else g_strdup_printf("unknown type %d")' and
IIRC even started typing it, but then stopped.

Although actually, that was before I was asked to convert to QMP, and
it wasn't as simple as g_strdup_printf(). It's probably easier now. I
can do it if you prefer, just for appearance's sake and paranoia?

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p->type =3D=3D EVTCHNST=
AT_interdomain) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inf=
o->remote_domain =3D g_strdup((p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU)=
 ?
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "qemu" : "loopback");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inf=
o->target =3D p->type_val & PORT_INFO_TYPEVAL_REMOTE_PORT_MASK;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inf=
o->target =3D p->type_val;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->vcpu =3D p->vcpu;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->pending =3D test_bit(=
i, pending);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->masked =3D test_bit(i=
, mask);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QAPI_LIST_APPEND(tail, info=
);
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return head;
> > +}
> > +
> > +void qmp_xen_event_inject(uint32_t port, Error **errp)
> > +{
> > +=C2=A0=C2=A0=C2=A0 XenEvtchnState *s =3D xen_evtchn_singleton;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (!s) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Xen event=
 channel emulation not enabled");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if (!valid_port(port)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Invalid p=
ort %u", port);
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 QEMU_LOCK_GUARD(&s->port_lock);
> > +
> > +=C2=A0=C2=A0=C2=A0 if (set_port_pending(s, port)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Failed to=
 set port %u", port);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +void hmp_xen_event_list(Monitor *mon, const QDict *qdict)
> > +{
> > +=C2=A0=C2=A0=C2=A0 EvtchnInfoList *iter, *info_list;
> > +=C2=A0=C2=A0=C2=A0 Error *err =3D NULL;
> > +
> > +=C2=A0=C2=A0=C2=A0 info_list =3D qmp_xen_event_list(&err);
> > +=C2=A0=C2=A0=C2=A0 if (err) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hmp_handle_error(mon, err);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 for (iter =3D info_list; iter; iter =3D iter->next)=
 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EvtchnInfo *info =3D iter->=
value;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 monitor_printf(mon, "port %=
4lu: vcpu: %ld %s", info->port, info->vcpu,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->type)=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strcmp(info->type, "ipi=
")) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mon=
itor_printf(mon,=C2=A0 "(");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(info->remote_domain) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 monitor_printf(mon, "%s:", info->remote_domain);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mon=
itor_printf(mon, "%ld)", info->target);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (info->pending) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mon=
itor_printf(mon, " PENDING");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (info->masked) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mon=
itor_printf(mon, " MASKED");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 monitor_printf(mon, "\n");
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 qapi_free_EvtchnInfoList(info_list);
> > +}
> > +
> > +void hmp_xen_event_inject(Monitor *mon, const QDict *qdict)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int port =3D qdict_get_int(qdict, "port");
> > +=C2=A0=C2=A0=C2=A0 Error *err =3D NULL;
> > +
> > +=C2=A0=C2=A0=C2=A0 qmp_xen_event_inject(port, &err);
> > +=C2=A0=C2=A0=C2=A0 if (err) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hmp_handle_error(mon, err);
> > +=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 monitor_printf(mon, "Delive=
red port %d\n", port);
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
>=20
> In general, I prefer to keep HMP commands separate, say in
> i386-kvm-hmp-cmds.c.=C2=A0 Not sure it's worth the trouble here.
>=20
> > diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
> > index 5d3e03553f..670f8b3f7d 100644
> > --- a/hw/i386/kvm/xen_evtchn.h
> > +++ b/hw/i386/kvm/xen_evtchn.h
> > @@ -16,6 +16,9 @@ void xen_evtchn_create(void);
> > =C2=A0int xen_evtchn_soft_reset(void);
> > =C2=A0int xen_evtchn_set_callback_param(uint64_t param);
> > =C2=A0
> > +void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
> > +void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
> > +
>=20
> Have you considered include/monitor/hmp.h?
>=20
> > =C2=A0struct evtchn_status;
> > =C2=A0struct evtchn_close;
> > =C2=A0struct evtchn_unmask;
> > diff --git a/monitor/misc.c b/monitor/misc.c
> > index bf3f1c67ca..7d8c473ffb 100644
> > --- a/monitor/misc.c
> > +++ b/monitor/misc.c
> > @@ -82,6 +82,10 @@
> > =C2=A0/* Make devices configuration available for use in hmp-commands*.=
hx templates */
> > =C2=A0#include CONFIG_DEVICES
> > =C2=A0
> > +#ifdef CONFIG_XEN_EMU
> > +#include "hw/i386/kvm/xen_evtchn.h"
> > +#endif
> > +
>=20
> Uh... what for?
>=20

For hmp_xen_event_{inject,list}, so I can drop this after I move those
declarations to include/monitor/hmp.h as you suggested. Thanks.

> > =C2=A0/* file descriptors passed via SCM_RIGHTS */
> > =C2=A0typedef struct mon_fd_t mon_fd_t;
> > =C2=A0struct mon_fd_t {
> > diff --git a/qapi/misc.json b/qapi/misc.json
> > index 27ef5a2b20..6284f86a5b 100644
> > --- a/qapi/misc.json
> > +++ b/qapi/misc.json
> > @@ -584,3 +584,94 @@
> > =C2=A0{ 'event': 'VFU_CLIENT_HANGUP',
> > =C2=A0=C2=A0 'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 'dev-id': 'str', 'dev-qom-path': 'str' } }
> > +
> > +##
> > +# @EvtchnInfo:
> > +#
> > +# Information about a Xen event channel port
> > +#
> > +# @port: the port number
> > +#
> > +# @vcpu: target vCPU for this port
> > +#
> > +# @type: the port type
> > +#
> > +# @remote-domain: remote domain for interdomain ports
> > +#
> > +# @target: remote port ID, or virq/pirq number
> > +#
> > +# @pending: port is currently active pending delivery
> > +#
> > +# @masked: port is masked
> > +#
> > +# Since: x.xx
>=20
> "Since: 8.0.0" (with any luck).=C2=A0 More of the same below.
>=20
> > +##
> > +{ 'struct': 'EvtchnInfo',
> > +=C2=A0 'data': {'port': 'int',
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'vcpu': 'int',
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'type': 'str',
>=20
> Could we make this a QAPI enum?

That would be good; I didn't spot that those existed.=20

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'remote-domain'=
: 'str',
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'target': 'int'=
,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'pending': 'boo=
l',
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'masked': 'bool=
'}}
> > +
> > +
> > +##
> > +# @xen-event-list:
> > +#
> > +# Query the Xen event channels opened by the guest.
> > +#
> > +# Returns: list of open event channel ports.
> > +#
> > +# Since: x.xx
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "xen-event-list" }
> > +# <- { "return": [
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "pending": false,
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "port": 1,
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "vcpu": 1,
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "remote-domain": "qemu",
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "masked": false,
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "type": "interdomain",
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "target": 1
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "pending": false,
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "port": 2,
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "vcpu": 0,
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "remote-domain": "",
>=20
> Uh, "" is possible?=C2=A0 @remote-domain's doc string didn't prepare me f=
or
> that.=C2=A0 What does it mean?
>=20

It means "this is a type for which remote_domain isn't meaningful,
because it isn't an interdomain port at all. In an ideal world, the
remote_domain element wouldn't even exist but Dave didn't know how to
make it optional/absent and forgot to call attention to that in the
commit message."

> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "masked": false,
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "type": "virq",
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "target": 0
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
> > +#=C2=A0=C2=A0=C2=A0 }
> > +#
> > +##
> > +{ 'command': 'xen-event-list',
> > +=C2=A0 'returns': ['EvtchnInfo']
> > +}
> > +
> > +##
> > +# @xen-event-inject:
> > +#
> > +# Inject a Xen event channel port to the guest.
>=20
> Would it be useful to explain what it means to "inject a Xen event
> channel port to the guest"?=C2=A0 I have no idea, but perhaps we believe
> interested in this command should be able to explain it in their sleep.

It's an interrupt. I'll just put '(interrupt)' after the word 'port'.

> > +#
> > +# @port: The port number
> > +#
> > +# Returns: - Nothing on success.
> > +#
> > +# Since: x.xx
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "xen-event-inject", "arguments": { "port": 1 } }
> > +# <- { "return": { } }
> > +#
> > +##
> > +{ 'command': 'xen-event-inject',
> > +=C2=A0 'data': { 'port': 'uint32' }
> > +}
>=20
> Did you consider 'if': 'CONFIG_XEN'?

This is the "Xen emulation on not-Xen" code, so it isn't CONFIG_XEN.

It would have been CONFIG_XEN_EMU perhaps, but that's a target-specific
option.

> Hmm, it's target-dependent, so it would have to go into
> misc-target.json.=C2=A0 qmp_xen_event_inject() then needs target-dependen=
t
> header qapi/qapi-commands-misc-target.h.=C2=A0 Fine if it's in a
> target-dependent .c anyway.=C2=A0 Else it could be more trouble than it's
> worth.

I'd already put empty stubs in to cover other targets, but it would be
good to drop those. Will play and send an incremental patch. Thanks.




--=-VtRI2scLRVOTkAG0y6KV
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMTE3MTA0MTIzWjAvBgkqhkiG9w0BCQQxIgQg+QQfkrj+
/FBRbnUzrBUOpjfY6qbhCYB/Gtaah+0dkQgwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCD2dDp8kg0TXeHK8l7GIfBfeIXcE+6hllV
B++XyxksAEtzC6/07t+S2IG2ltAgKkluO+EOiK8aUp2viiY/txsUko+o0Oz6ctHd2Q3r9RGM5XHT
1o++dbcBBvpp2NbcEoT/aEISyL6xqT1QyhwWP26+GYVk1OS75omYZ5dxPteskhu4w62F2fEY1f84
fLhCu0Am9VumZWENlDFykkuSfnnIK6b7k4QsDYMpzGA2d88Ew19/T8D4DvU9Xh1Eh0VAOnB4gCxW
huMXshy/b5eYnAf72yNqzSjXbRyIiDeFVWLFlBLHI6gnFMab3dqS1C1N38Hy3aWM+ec84btPOhdg
Da6Uj0a3UrTbWu4oELsKl/W13xxFuvOwUgYcPzlAWaRSIfXlDLAtNYfCaSbHDvFYNrZrVgi20aLP
bDBvM3J6XSKRhbqMChMITh2SYtFYWri03Cm6T7OZbhty7jMohekHN1rOI5mBBzsrgdRo2O7PzLZ/
uOliZoudkVy79v4SiPPnMwZ9XxEqGe03+fSsmyBWGWhWmiaC7fjX0R5wfuBUbnfYbH8aM1TK2KT7
VAIqCpbj8VfqqZ+KDz+wrs4PQmOr2ux+l7yWxf9uu4NGBeZPUTrD1A5sCFhjI+G+IwdSVcE5AeCc
OpDTuhatchjuZOry2wKGD+RIxZzBXDjOoKuJqVUoGAAAAAAAAA==


--=-VtRI2scLRVOTkAG0y6KV--

